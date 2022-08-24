ARG IMG=node:12-buster-slim
FROM ${IMG}
COPY package.json /npm/
WORKDIR /npm

RUN set -eux \
  ; npm install
