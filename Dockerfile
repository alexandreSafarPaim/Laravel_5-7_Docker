FROM wyveo/nginx-php-fpm:php72
WORKDIR /usr/share/nginx/
RUN rm -rf /usr/share/ngix/html
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.2-mysql php7.2-redis
COPY . /usr/share/nginx
RUN chmod -R 775 /usr/share/nginx/storage/*
RUN ln -s public html
