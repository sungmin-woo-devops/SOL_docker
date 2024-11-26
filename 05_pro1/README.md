docker build --no-cache -t tri-back-home .

docker run -d --name tri01 -p 3000:3000 tri-back-home:l.0