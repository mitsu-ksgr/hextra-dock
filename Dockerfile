#
# Dockerfile for hextra-dock
#
# * Hugo docker image
# - https://github.com/gohugoio/hugo
# - https://github.com/gohugoio/hugo/pkgs/container/hugo
#

#ARG HUGO_VERSION="latest"
ARG HUGO_VERSION="v0.139.2"

FROM ghcr.io/gohugoio/hugo:${HUGO_VERSION}

ENV DOCS_PATH=/project/app/content/docs
ENV DOCS_SYNC_INTERVAL=5

USER hugo
WORKDIR /project/app
COPY --chown=hugo ./hugo-hextra /project/app
RUN hugo mod get -u

USER root
RUN apk --no-cache add rsync

RUN mkdir /docs
RUN chown -R hugo:hugo /docs
COPY --chmod=744 ./docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN mkdir /conf
RUN chown -R hugo:hugo /conf

ENTRYPOINT ["/bin/sh", "/usr/bin/docker-entrypoint.sh"]
# CMD ["server", "-D", "--bind", "0.0.0.0"]

