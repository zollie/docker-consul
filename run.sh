#!/bin/bash

dc="$1"; shift

retries=
IFS=' '
for i in "$@"; do retries="$retries -retry-join=$i \\"; done

retries=${retries%"\\"}

cmd="consul agent \
-bootstrap-expect=3 \
-server=true \
-data-dir=\"/data\" \
-syslog \
-retry-interval=\"15s\" \
-log-level=\"DEBUG\" \
-dc=$dc \
$retries"

$cmd

