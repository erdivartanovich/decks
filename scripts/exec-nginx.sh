if [ ! "$1" ]; then
    docker exec -it nginx sh
else
    docker exec -it nginx "$@"
fi
