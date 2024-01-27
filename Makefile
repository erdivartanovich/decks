##
# Makefile

# Specify the default target
all: run_script

# Default run without argument
run_script:
	docker-compose up -d --build

# run containers
up:
	docker-compose up -d

# stop all containers
down:
	docker-compose down

restart:
	docker-compose restart $< $(s)

php:
	docker exec -it php-fpm $< $(c)

mysql:
	docker exec -it mysql $< $(c)

# Phony target to prevent conflicts with file named "all"
.PHONY: all up down restart

# end
