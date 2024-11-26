#!/bin/bash

# 네트워크 추가
docker network create mongo-net

# mongodb 컨테이너 실행
docker run -d --name mongodb \
--net mongo-net \
--restart=always \
-e MONGO_INITDB_ROOT_USERNAME=root \
-e MONGO_INITDB_ROOT_PASSWORD=example \
mongo

# mongo-express 컨테이너 실행
docker run -d --name mongo-express \
--net mongo-net \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=root \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=example \
-e ME_CONFIG_MONGODB_URL=mongodb://root:example@mongodb:27017/ \
-e ME_CONFIG_BASICAUTH=false \
mongo-express

firefox http:/localhost:8081
docker ps -a

docker volume ls
docker network ls
docker 

docker rm -f $(docker ps -aq)
docker volume prune -f 
docker network prune -f