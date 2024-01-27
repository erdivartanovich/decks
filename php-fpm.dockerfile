FROM php:8.2-fpm-alpine

# add sudo
RUN apk --no-cache add sudo

# Install Composer
RUN apk --no-cache add composer

# Install the required extensions
RUN apk --no-cache add \
    libzip-dev \
    zip \
    php-session \
    php-tokenizer \
    php-xml \
    php-dom \
    php-xmlwriter \
    php-fileinfo

# Use the default production configuration
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
