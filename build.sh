#!/usr/bin/env bash
#
# Build the hextra-dock docker image.
#
set -u


readonly DOCKER_TAG="hextra-dock"

cd $(dirname $0)

docker build -t ${DOCKER_TAG}:latest .

cat <<__EOS__

* Run astro-dock container

$ docker run --rm -it -p 1313:1313 -v ./sample-docs:/docs hextra-dock:latest

__EOS__

exit 0

