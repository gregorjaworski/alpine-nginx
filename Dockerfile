FROM alpine
MAINTAINER grzegorjaworski  <webmstr@grzegorzjaworski.de>

# Installation of Nginx
RUN apk add nginx

# Create web-user
RUN adduser -D -u 1000 -g 'www' www

# Create www-dir
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Change of default configuration
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# copy sefault page
COPY index.html /www/index.html
COPY index.php /www/index.php

# run nginx 
rc-service nginx start

#set default port
EXPOSE 80

# rm instalations & old files 
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
