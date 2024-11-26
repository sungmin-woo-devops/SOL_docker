# 테트리스 게임

## 1. 컨테이너 실행 방법
docker run -d --name mygame -p 8080:8080 sungminwoo0612/mygame
- `-d` : 백그라운드 실행
- `--name` : 컨테이너 이름
- `-p` : 포트 포워딩 (호스트포트:컨테이너포트)

## 2. 컨테이너 제작 시 참고사항
- 참고 사이트: https://github.com/hashicorp/learn-go-webapp-demo
- 추가 참고 사이트

## 3. Dockerfile

```Dockerfile
FROM golang:1.16

RUN go get -d github.com/hashicorp/learn-go-webapp-demo
WORKDIR /go/pkg/mod/github.com/hashicorp/learn-go-webapp-demo@v0.0.0-20230113184849-2801371511c4

EXPOSE 8080

CMD ["go", "run", "webapp.go"]
```