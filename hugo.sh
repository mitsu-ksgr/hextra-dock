#!/usr/bin/env bash
#
# Preivew docs in localhost with hugo run on docker.
#
set -u
umask 0022
export LC_ALL=C
readonly SCRIPT_NAME=$(basename $0)


#
# * Hugo docker image
#
# - https://github.com/gohugoio/hugo
# - https://github.com/gohugoio/hugo/pkgs/container/hugo
#
DOCKER_HUGO_TAG="ghcr.io/gohugoio/hugo"
#DOCKER_HUGO_VER="latest"
DOCKER_HUGO_VER="v0.139.2"
DOCKER_HUGO="${DOCKER_HUGO_TAG}:${DOCKER_HUGO_VER}"



#
# * Run hugo on docker.
#
cd $(dirname $0)

docker run \
    --rm -it \
    -v $(pwd):/project \
    -p 1313:1313 \
    ${DOCKER_HUGO}

