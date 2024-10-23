#!/bin/sh
#
# docker-entrypoint.sh
#
#
set -u


# Sync interval
rsync_interval="${DOCS_SYNC_INTERVAL}"
if [[ -z "${rsync_interval}" ]]; then
    rsync_interval=5
fi
echo "rsync interval ... ${rsync_interval}"


# initial sync
rsync -av --delete --quiet /docs/ ${DOCS_PATH}/

# background sync
while true; do
    rsync -av --delete --quiet /docs/ ${DOCS_PATH}/
    sleep ${rsync_interval}
done &


runuser -u hugo -- \
    hugo server -D --bind 0.0.0.0


exit 0

