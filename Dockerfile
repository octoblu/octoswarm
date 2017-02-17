FROM alpine:latest
MAINTAINER Octoblu <docker@octoblu.com>

RUN apk add -q --no-cache curl docker openssh-client bash jq python3 gettext coreutils
RUN pip3 install --upgrade pip
RUN pip3 install awscli

RUN curl -fsSLO https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-Linux-x86_64
RUN mv docker-machine-Linux-x86_64 /usr/local/bin/docker-machine
RUN chmod +x /usr/local/bin/docker-machine

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz
RUN tar --strip-components=1 -xvzf docker-1.13.1.tgz -C /usr/local/bin
RUN chmod +x /usr/local/bin/docker

RUN mkdir -p /usr/src/app
RUN adduser -D -u 501 octoblu

LABEL io.whalebrew.config.environment='[ \
  "AWS_ACCESS_KEY_ID", \
  "AWS_SECRET_ACCESS_KEY", \
  "AWS_DEFAULT_REGION", \
  "BEEKEEPER_URI", \
  "DEBUG", \
  "SAY_YES" \
]'

ENV DOCKER_MACHINE_NAME=default
ENV DOCKER_MACHINE_PORT=2376
ENV STACK_BIN_DIR /usr/src/app/stack
ENV OCTOSWARM_BIN_DIR /usr/src/app/bin
ENV STACK_CONFIG_PATH /workdir/cluster.json
ENV STACK_DIR /workdir
ENV STACK_ENV_DIR /workdir/env.d
ENV MACHINE_STORAGE_PATH /workdir/docker-machine

COPY octoswarm /usr/local/bin/octoswarm
COPY . /usr/src/app
COPY bin/* /usr/local/bin/

ENTRYPOINT ["octoswarm"]
