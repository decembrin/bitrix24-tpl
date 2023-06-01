FROM php:8.0-apache

WORKDIR /home/bitrix/www

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        mc \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

ADD ./etc/apache2/apache2.conf /etc/apache2/apache2.conf
ADD ./etc/apache2/bx/ /etc/apache2/bx/

ADD ./usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/

RUN mkdir -p /tmp/php_sessions/www
RUN mkdir -p /tmp/php_sessions/ext_www
RUN chown -R www-data:www-data /tmp/php_sessions
RUN chmod -R 770 /tmp/php_sessions

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]