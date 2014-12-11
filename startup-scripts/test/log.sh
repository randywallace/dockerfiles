#!/bin/bash

FACILITY='cron'
#TEE_OUTPUT=true
#SYSLOG=false
HOST_SYSLOG_DAEMON='127.0.0.1'

CURDIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "${CURDIR}/../core.sh.lib"

echo test1

echo test2 >&2

log test3
info test4
error test5
critical test6
alert test7
notice test8
debug test9
warning test10
echo 'test11' | log_stdin

ping -c 4 google.com | debug_stdin

sleep 0.1
