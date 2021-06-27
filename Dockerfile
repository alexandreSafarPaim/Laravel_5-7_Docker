FROM wyveo/nginx-php-fpm:php72

#####################################
# Non-Root User:
#####################################
# User Arg
ARG PUID
ARG PGID
# Use user=larauser in docker-compose comands
# If you want, create a alias to "docker-compose exec --user=larauser"
RUN groupadd -g $PGID larauser && \
    useradd -u $PUID -g larauser -m larauser

WORKDIR /usr/share/nginx/
RUN rm -rf /usr/share/ngix/html
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.2-mysql php7.2-redis
COPY . /usr/share/nginx
RUN chmod -R 777 /usr/share/nginx/storage/*
RUN ln -s public html
