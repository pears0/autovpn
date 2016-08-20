#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

if [[ $`home_status` = 0 ]]; then
	if [[ -f '$home_password_file' ]]; then
		if [[ -f '$home_config_file' ]]; then
			log "Starting home connection"
			nmcli con up id home
		else
			log "Home connection config file not found"
		fi
	else
		log "Office connection auth file not found"
	fi	
else
	log "Conection is already running, check link status"
fi
