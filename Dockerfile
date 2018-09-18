FROM nginx:stable

WORKDIR /root

RUN apt-get update \
    && apt-get install -y certbot python-certbot-nginx \
    && apt-get install -y wget \
    && wget https://dl.eff.org/certbot-auto \
    && chmod a+x ./certbot-auto \
    && sed -i '$ d' /etc/nginx/nginx.conf \
    && echo "    client_max_body_size 20M;" >> /etc/nginx/nginx.conf \
    && echo "    include /app/sites/*.conf;" >> /etc/nginx/nginx.conf \
    && echo "}" >> /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

ENTRYPOINT /etc/init.d/nginx restart && /bin/bash
