#!/bin/sh
#
# Run docker-compose in a container
#
# This script will attempt to mirror the host paths by using volumes for the
# following paths:
#   * ${PWD}
#
# You can add additional volumes (or any docker run options) using
# the ${XQ_OPTIONS} environment variable.
#
# You can set a specific image tag from Docker Hub, such as "2.11.1-ls1"
# using the $YQ_IMAGE_TAG environment variable (defaults to "latest")
#

set -e

IMAGE="linuxserver/yq:${YQ_IMAGE_TAG:-latest}"

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

# shellcheck disable=SC2086
exec docker run --rm ${DOCKER_RUN_OPTIONS} ${XQ_OPTIONS} ${VOLUMES} -w "${PWD}" --entrypoint xq "${IMAGE}" "$@"
