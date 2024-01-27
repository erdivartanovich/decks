
FROM	php:8.2-fpm-alpine
RUN	apk add --no-cache \
	sudo
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
	&& docker-php-ext-enable pdo_mysql
