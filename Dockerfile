FROM alpine:latest
MAINTAINER Kiritzai Kirigaya <archetype.demo@gmail.com>

RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx git && \
	mkdir -p /var/www && \
	cd /var/www && \
	git clone https://github.com/Dashticz/dashticz_v2.git
	
ADD default.conf /etc/nginx/conf.d/

RUN mkdir -p /tmp && \
	mkdir -p /run/nginx && \
	echo "cd /var/www/dashticz && git pull && nginx && read name" > /tmp/start.sh

EXPOSE 80

ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
