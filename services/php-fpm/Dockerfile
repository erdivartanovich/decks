
FROM	php:8.2-fpm-alpine
RUN	apk add --no-cache \
	composer
RUN	apk add --no-cache \
	libzip-dev \
	zip \
	php-session \
	php-tokenizer \
	php-xml \
	php-dom \
	php-xmlwriter \
	php-fileinfo
RUN	docker-php-ext-install mysqli pdo pdo_mysql \
	&& docker-php-ext-enable pdo pdo_mysql
RUN	apk add --no-cache \
	libpng \
	libpng-dev \
	libjpeg-turbo \
	libjpeg-turbo-dev \
	freetype \
	freetype-dev \
	&& docker-php-ext-configure gd --with-jpeg --with-freetype \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-enable gd
COPY	scripts/set-laravel-permissions.sh	/usr/bin/
