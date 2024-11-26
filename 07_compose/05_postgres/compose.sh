#!/bin/bash

docker network create postgresdb-net
docker run -d --name postgresdb \
--net postgresdb-net \
-e POSTGRES_PASSWORD=example \
--shm-size="128m" \
--restart=always \
postgres

docker run -d --name adminer \
--net postgresdb-net \
--restart=always \
-p 8080:8080 \
adminer 

firefox http:/localhost:8080 &
docker ps -a

docker volume ls
docker network ls
docker 

docker rm -f $(docker ps -aq)
docker volume prune -f 
docker network prune -f