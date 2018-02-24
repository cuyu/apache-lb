FROM httpd:alpine

RUN apk update && apk add mc apache2-proxy

COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY conf/httpd-vhosts.conf conf/proxy-html.conf conf/app.conf /usr/local/apache2/conf/extra/
