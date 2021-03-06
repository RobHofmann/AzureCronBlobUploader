#!/bin/bash

# Make sure CRON is being setup
if [[ -n "$UPLOAD_CRON_EXPRESSION" ]]; then
  ln -sf /proc/$$/fd/1 /var/log/stdout
  service cron start
	if [[ -n "$UPLOAD_CRON_EXPRESSION" ]]; then
        echo "$UPLOAD_CRON_EXPRESSION /scripts/runUploader.sh $BLOB_DESTINATIONCONTAINER_URL $BLOB_DESTINATIONKEY >/var/log/stdout 2>&1" > /etc/crontab
	fi
	crontab /etc/crontab
fi

# Tail to let the container run
tail -f /dev/null