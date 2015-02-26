#!/bin/bash

docker run -d --name=consul --restart=always --net=host -v /var/run/docker.sock:/var/run/docker.sock zollie/consul "$@"

