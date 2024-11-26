목표:
- NGINX를 리버스 프록시로 구성
- 백엔드 웹서버 3대 운영
- 로드밸런싱 알고리즘 실습
- 헬스체크 구현
- SSL/TLS 설정

실습 내용:
- NGINX 컨테이너 구성
- 백엔드 Apache 컨테이너 3대 구성
- 로드밸런싱 알고리즘 비교 (Round Robin, IP Hash, Least Connection)
- SSL 인증서 생성 및 적용
- 로그 수집 및 분석


docker run --detach \
    --name nginx-proxy \
    --publish 80:80 \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    nginxproxy/nginx-proxy:1.6


### 스웜 클러스터를 활성화 시켜준다.
[root@docker1 ~/docker/05_minpro5]$ docker swarm init
Swarm initialized: current node (9vvvpyl7iww85vu4pmu3etr96) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-61vw5befawvxcgqgkym6geu5fic5h5743vjxi4jntiqlkpk9fu-dbsqgvutk6c96dhqaj8ccizfi 192.168.10.10:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

### 이미지 빌드/푸시
docker build --no-cache -t myhttpd:1.0 -f ./web/Dockerfile ./web
docker tag myhttpd:1.0 sungminwoo0612/myhttpd:1.0
docker push sungminwoo0612/myhttpd:1.0

### 도커 스웜 서비스 생성/삭제
docker stack deploy -c docker-compose.yaml my_stack --detach=false
docker stack rm my_stack

- --detach=false
- docker stack deploy 명령을 실행할 때, 명령이 백그라운드에서 실행되지 않고 포그라운드에서 실행되도록 함
- 사용 시 배포 프로세스가 완료될 때까지 명령 프롬프트가 차단
- 배포 상태 실시간 모니터링 용이
- Swarm 모드에서는 이미 빌드된 이미지를 사용해야 함

### 도커 스웜 서비스 조회
docker stack ls
docker service ls
docker service ls --filter label=com.docker.stack.namespace=my_stack