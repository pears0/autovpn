#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ $`office_status` = 0 ]]; then
	if [[ -f '$office_password_file' ]]; then
		if [[ -f '$office_config_file' ]]; then
			log "Starting office connection"
			systemctl start openvpn@office.service
		else
			log "Office connection config file not found"
		fi
	else
		log "Office connection auth file not found"
	fi
else
	log "Connection is already running, check link status"
fi