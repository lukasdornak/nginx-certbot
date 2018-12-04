FROM nginx:stable-alpine

LABEL name="nginx-certbot"
LABEL maintainer="Lukáš Dorňák <lukasdornak@gmail.com>"

RUN apk update; \
    apk add --update --no-cache certbot py2-pip; \
	pip install certbot-nginx;

EXPOSE 80
EXPOSE 443

ENTRYPOINT /bin/ash
