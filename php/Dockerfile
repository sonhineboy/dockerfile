FROM php:7.2.10-fpm
MAINTAINER mr.xu <var_dump@foxmail.com>

ENV TZ "Asia/Shanghai"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
#COPY sources.list /etc/apt/
ADD ext/geoip /usr/src/php/ext/
ADD ext/yar /usr/src/php/ext/
ADD ext/msgpack /usr/src/php/ext/
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libxml2-dev \
	procps \
	supervisor \
	cron \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install gettext \
    && docker-php-ext-install intl \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install shmop \
    && docker-php-ext-install soap \
    && docker-php-ext-install sockets \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install xmlrpc \
#    && docker-php-ext-install yar \
#    && docker-php-ext-install geoip \
#    && docker-php-ext-install msgpack \
    && rm -r /var/lib/apt/lists/*

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/4.0.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis
ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/start.sh"]
