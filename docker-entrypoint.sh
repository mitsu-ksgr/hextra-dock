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
echo "rsync interval: ${rsync_interval}"

# Search config file.
opt_conf=""
for f in $(\
    find /conf \
        -maxdepth 1 -type f \
        -regex '.*\/\(hugo\|config\)\.\(toml\|yaml\|json\)' \
    ); do
    echo "Config file path: ${f}"
    opt_conf="--config ${f}"
    break
done


# initial sync
rsync -av --delete --quiet /docs/ ${DOCS_PATH}/

# background sync
while true; do
    rsync -av --delete --quiet /docs/ ${DOCS_PATH}/
    sleep ${rsync_interval}
done &


# Run hugo
runuser -u hugo -- \
    hugo ${opt_conf} server -D --bind 0.0.0.0

exit 0

