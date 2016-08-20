#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ `home_status` = 0 ]]; then
	log "Starting home connection"
	nmcli con up id home >>$LOGFILE 2>&1
else
	log "Home connection already running"
fi
