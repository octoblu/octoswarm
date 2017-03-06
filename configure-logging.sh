#!/bin/bash

LOGENTRIES_SERVICE_NAME='log-to-logentries'

usage(){
  echo 'USAGE: configure-logging <logentries-token>'
  echo ''
  echo 'Arguments:'
  echo '  -h, --help         print this help text'
  echo '  -v, --version      print the version'
  echo ''
}

version() {
  echo '1.0.0'
}

assert_logentries_token() {
  local logentries_token="$1"
  if [ -z "$logentries_token" ]; then
    echo "Missing logentries token"
    exit 1
  fi
}

create_octoswarm_dir() {
  mkdir -p /run/octoswarm
}

write_script() {
  local logentries_token="$1"
  echo "#!/bin/bash
journalctl --utc --follow --output=short | awk -v token=$logentries_token '{ print token, \$0; fflush(); }' | ncat --ssl --ssl-verify data.logentries.com 20000" \
  > "/run/octoswarm/${LOGENTRIES_SERVICE_NAME}.sh"
}

make_executable() {
  chmod +x "/run/octoswarm/${LOGENTRIES_SERVICE_NAME}.sh"
}

write_unit_file() {
  echo "[Unit]
Description=Push journal logs to logentries.com
After=systemd-journald.service
After=systemd-networkd.service
[Service]
Restart=always
ExecStart=/bin/bash /run/octoswarm/${LOGENTRIES_SERVICE_NAME}.sh
[Install]
WantedBy=multi-user.target" > "/run/octoswarm/${LOGENTRIES_SERVICE_NAME}.service"
}

enable_unit() {
  systemctl link "/run/octoswarm/${LOGENTRIES_SERVICE_NAME}.service" \
   && systemctl enable "${LOGENTRIES_SERVICE_NAME}.service" \
   && systemctl start "${LOGENTRIES_SERVICE_NAME}.service"
}

main() {
  local logentries_token="$1"
  case "$logentries_token" in
    -h | --help | help)
      usage
      exit 0
      ;;
    -v | --version | version)
      version
      exit 0
      ;;
  esac
  assert_logentries_token "$logentries_token"
  create_octoswarm_dir \
  && write_script "$logentries_token" \
  && make_executable \
  && write_unit_file \
  && enable_unit
}

main "$@"
