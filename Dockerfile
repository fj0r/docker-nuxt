ARG IMG=node:16-buster-slim
FROM ${IMG}
COPY package.json /npm/
WORKDIR /npm

RUN set -eux \
  ; apt-get update \
  ; apt-get upgrade -y \
  ; DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        procps curl jq tree inetutils-ping \
  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; npm install \
  ; npm install sharp@0.29.0
