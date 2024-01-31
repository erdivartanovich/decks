if [ ! "$1" ]; then
    docker exec -it php-fpm sh
else
    docker exec -it php-fpm "$@"
fi
