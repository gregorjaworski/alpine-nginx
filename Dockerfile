FROM alpine
MAINTAINER grzegorjaworski  <webmstr@grzegorzjaworski.de>

# Installation of Nginx
RUN apk update
RUN apk add nginx

# Create web-user
RUN adduser -D -u 1000 -g 'www' www

# Create www-dir
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Change of default configuration
COPY nginx.conf /etc/nginx/nginx.conf

# copy sefault page
COPY index.html /www/index.html
COPY index.php /www/index.php

# add runing scriopts
COPY run.sh run.sh

#set default port
EXPOSE 80 443 22

CMD ['run.sh']
