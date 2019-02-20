#!/bin/bash

push="${1}"
if [ "${push}" == '-push' ]; then
    shift 1
fi

tag="${1}"
image="${2}"

image="${DOCKER_REGISTRY}${DOCKER_USER}/${image}"

docker image tag "${image}:latest" "${image}:${tag}"

if [ "${push}" == '-push' ]; then
    $(dirname "${0}")/push.sh "${@}"
fi
