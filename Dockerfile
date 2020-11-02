FROM ghcr.io/linuxserver/baseimage-alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
ARG YQ_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="nemchik"

RUN \
  echo "**** install runtime packages ****" && \
  apk add --no-cache \
    jq \
    py3-pip \
    python3 && \
  echo "**** install app ****" && \
  if [ -z ${YQ_VERSION+x} ]; then \
    YQ="yq"; \
  else \
    YQ="yq==${YQ_VERSION}"; \
  fi && \
  pip3 install -U --no-cache-dir \
    ${YQ}
