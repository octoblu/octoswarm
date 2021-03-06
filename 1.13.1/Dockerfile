FROM octoblu/octoalpine-docker:1.13.1
MAINTAINER Octoblu <docker@octoblu.com>

RUN mkdir -p /usr/src/app
WORKDIR /workdir

LABEL io.whalebrew.name octoswarm-1.13.1

LABEL io.whalebrew.config.environment='[ \
  "AWS_ACCESS_KEY_ID", \
  "AWS_SECRET_ACCESS_KEY", \
  "AWS_DEFAULT_REGION", \
  "DOCKER_HUB_USERNAME", \
  "DOCKER_HUB_PASSWORD", \
  "BEEKEEPER_URI", \
  "DEBUG", \
  "SAY_YES", \
  "OCTOSWARM_LOGENTRIES_TOKEN", \
  "OCTOSWARM_GITHUB_API_TOKEN", \
  "OCTOSWARM_MACHINE", \
  "PINGDOM_APP_KEY", \
  "PINGDOM_USERNAME", \
  "PINGDOM_PASSWORD", \
  "TERM", \
]'

ENV DOCKER_MACHINE_NAME=default
ENV DOCKER_MACHINE_PORT=2376
ENV DOCKER_COMPOSE_YAML_PATH /workdir/docker-compose.yml
ENV DOCKER_CONFIG=/usr/local/etc/docker
ENV OCTOSWARM_BIN_DIR /usr/src/app/bin
ENV STACK_CONFIG_PATH /workdir/cluster.json
ENV STACK_DIR /workdir
ENV STACK_ENV_DIR /workdir/env.d
ENV MACHINE_STORAGE_PATH /workdir/docker-machine
ENV VERSION_FILE_PATH /usr/src/app/VERSION

COPY entrypoint /usr/local/bin/octoswarm
COPY . /usr/src/app
COPY bin/* /usr/local/bin/
RUN chmod -R uog+w /etc/passwd /home

ENTRYPOINT ["octoswarm"]
