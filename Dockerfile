FROM gliderlabs/alpine:3.1

# Mostly taken from gliderlabs/docker-consul
ADD https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip /tmp/webui.zip
RUN mkdir /ui && cd /ui && unzip /tmp/webui.zip && rm /tmp/webui.zip

ADD https://get.docker.io/builds/Linux/x86_64/docker-1.2.0 /bin/docker
RUN chmod +x /bin/docker

RUN apk-install -t curl 
RUN apk-install -t bash

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

RUN mkdir -p /consul/data
VOLUME ["/consul/data"]

ENV SHELL /bin/bash

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]

