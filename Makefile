##
# Makefile

# Specify the default target
all: build

# Default run without argument
build:
	./scripts/validate-setup.sh && docker-compose up -d --build

# run containers
up:
	docker-compose up -d

# stop all containers
down:
	docker-compose down

# restart services, e.g `make restart name="nginx php-fpm"`
restart:
	docker-compose restart $< $(name)

# exec php container commands, e.g `make php sh="composer install"`
php:
	./scripts/exec-phpfpm.sh $< $(sh)

# exec nginx container commands
nginx:
	./scripts/exec-nginx.sh $< $(sh)

# exec mysql container commands
mysql:
	./scripts/exec-mysql.sh $< $(sh)

# Phony target to prevent conflicts with file named "all"
.PHONY: all build up down restart

# end
