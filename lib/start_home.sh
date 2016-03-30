#!/bin/bash

if [[ $`home_status` = 0 ]]; then
	if [[ -f '$home_password_file' ]]; then
		if [[ -f '$home_config_file' ]]; then
			log "Starting home connection"
			systemctl start openvpn@home.service
		else
			log "Home connection config file not found"
		fi
	else
		log "Office connection auth file not found"
	fi	
else
	log "Conection is already running, check link status"
fi