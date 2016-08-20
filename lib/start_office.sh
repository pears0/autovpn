#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ `office_status` = 0 ]]; then
	log "Starting office connection"
	nmcli con up id office >>$LOGFILE 2>%1
else
	log "Office connection already up"
fi
