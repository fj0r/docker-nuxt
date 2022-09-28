ARG IMG=node:12-buster-slim
FROM ${IMG}
COPY package.json /npm/
WORKDIR /npm

RUN set -eux \
  ; apt-get update \
  ; apt-get upgrade -y \
  ; DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        procps curl jq tree inetutils-ping build-essential python2 \
  ; npm install \
  ; npm cache clean -f \
  ; apt-get purge -y --auto-remove build-essential python2 \
  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
