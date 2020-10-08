#!/bin/sh
#
# Run docker-compose in a container
#
# This script will attempt to mirror the host paths by using volumes for the
# following paths:
#   * ${PWD}
#
# You can add additional volumes (or any docker run options) using
# the ${YQ_OPTIONS} environment variable.
#
# You can set a specific image tag from Docker Hub, such as "2.11.1-ls1"
# using the $YQ_IMAGE_TAG environment variable (defaults to "latest")
#

set -e

IMAGE="linuxserver/yq:${YQ_IMAGE_TAG:-latest}"

# Setup options for connecting to docker host
if [ -z "${DOCKER_HOST}" ]; then
    DOCKER_HOST='unix:///var/run/docker.sock'
fi
if [ -S "${DOCKER_HOST#unix://}" ]; then
    DOCKER_ADDR="-v ${DOCKER_HOST#unix://}:${DOCKER_HOST#unix://} -e DOCKER_HOST"
else
    DOCKER_ADDR="-e DOCKER_HOST -e DOCKER_TLS_VERIFY -e DOCKER_CERT_PATH"
fi

# Setup volume mounts for compose config and context
if [ "${PWD}" != '/' ]; then
    VOLUMES="-v ${PWD}:${PWD}"
fi

# Only allocate tty if we detect one
if [ -t 0 ] && [ -t 1 ]; then
    DOCKER_RUN_OPTIONS="${DOCKER_RUN_OPTIONS} -t"
fi

# Always set -i to support piped and terminal input in run/exec
DOCKER_RUN_OPTIONS="${DOCKER_RUN_OPTIONS} -i"

# Handle userns security
if docker info --format '{{json .SecurityOptions}}' 2> /dev/null | grep -q 'name=userns'; then
    DOCKER_RUN_OPTIONS="${DOCKER_RUN_OPTIONS} --userns=host"
fi

# Detect SELinux and add --privileged if necessary
if docker info --format '{{json .SecurityOptions}}' 2> /dev/null | grep -q 'name=selinux'; then
    DOCKER_RUN_OPTIONS="${DOCKER_RUN_OPTIONS} --privileged"
fi

eval exec docker run --rm "${DOCKER_RUN_OPTIONS}" "${DOCKER_ADDR}" "${YQ_OPTIONS}" "${VOLUMES}" -w "${PWD}" "${IMAGE}" "$@"
