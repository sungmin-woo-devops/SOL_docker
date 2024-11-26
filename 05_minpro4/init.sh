#!/bin/bash

set -e 

docker network create ongamenet

cat << EOF >> Dockerfile
FROM golang:1.16

RUN go get -d github.com/hashicorp/learn-go-webapp-demo
WORKDIR pkg/mod/github.com/hashicorp/learn-go-webapp-demo*

COPY 

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]
EOF

docker build --no-cache -t mygameimage .

docker run -d --name mygame \
    -p 8080:8080 \
    --network ongamenet \
    mygameimage