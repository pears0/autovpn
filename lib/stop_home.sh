#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ $`home_status` = 1 ]]; then
	log "Stopping home connection"
	nmcli con down id home
else
	log "Home connection is already down"
fi
