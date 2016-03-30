#!/bin/bash

if [[ $`home_status` = 1 ]]; then
	log "Stopping home connection"
	systemctl stop openvpn@home.service
else
	log "Home connection is already down"
fi