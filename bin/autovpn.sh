#!/bin/bash

BASE=$(dirname $(readlink -f $0))/..

set -a
. $BASE/lib/functions
. $BASE/etc/config
set +a

while true; do
	
	if [[ "$(home_network_test)" == 0 ]]; then
		if [[ "$(home_status)" == 0 ]]; then
			start_home
		fi
	else
		if [[ "$(home_status)" == 1 ]]; then
			stop_home
		fi
	fi

	if [[ "$(office_network_test)" == 0 ]]; then
		if [[ "$(office_status)" == 0 ]]; then
			start_office
		fi
	else
		if [[ "$(office_status)" == 1 ]]; then
			stop_office
		fi
	fi

	sleep 60

done