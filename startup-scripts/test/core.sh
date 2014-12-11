#!/bin/bash

FACILITY='cron'
TEE_OUTPUT=true
#SYSLOG=false
HOST_SYSLOG_DAEMON='127.0.0.1'

CURDIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "${CURDIR}/../core.sh.lib"

( ok_die test1 )
( warn_die test2 )
( crit_die test3 )
( die test4 )

check_exit
