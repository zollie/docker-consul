#!/bin/bash

bse="$1"; shift
dc="$1"; shift

retries=
IFS=' '
for i in "$@"; do retries="$retries -retry-join=$i \\"; done

retries=${retries%"\\"}

cmd="consul agent \
-config-dir=/consul/config \
-server=true \
-data-dir=\"/consul/data\" \
-syslog \
-retry-interval=\"15s\" \
-log-level=\"DEBUG\" \
-bootstrap-expect=$bse \
-dc=$dc \
$retries"

$cmd


