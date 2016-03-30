#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ $`office_status` = 1 ]]; then
	log "Stopping office connection"
	systemctl stop openvpn@office.service
else
	log "Office connection is already down"
fi