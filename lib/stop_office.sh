#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ `office_status` = 1 ]]; then
	log "Stopping office connection"
	nmcli con down id office >> $LOGFILE 2>&1
else
	log "Office connection is already down"
fi
