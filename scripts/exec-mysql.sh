if [ ! "$1" ]; then
    docker exec -it mysql sh
else
    docker exec -it mysql "$@"
fi
