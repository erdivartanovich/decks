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

# restart a service
restart:
	docker-compose restart $< $(s)

# exec php container commands, e.g make php -c="composer install"
php:
	docker exec -it php-fpm $< $(c)

# exec nginx container commands
nginx:
	docker exec -it nginx $< $(c)

# exec mysql container commands
mysql:
	docker exec -it mysql $< $(c)

# Phony target to prevent conflicts with file named "all"
.PHONY: all build up down restart

# end
