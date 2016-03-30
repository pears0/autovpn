#!/bin/bash

if [[ $`office_status` = 1 ]]; then
	log "Stopping office connection"
	systemctl stop openvpn@office.service
else
	log "Office connection is already down"
fi