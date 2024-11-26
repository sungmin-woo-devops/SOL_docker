# 컨테이너 실행 방법
docker run -d --name -p 8080:8080 spartan
- `-d` : 백그라운드 실행
- `--name` : 컨테이너 이름
- `-p` : 포트 포워딩 (호스트포트:컨테이너포트)

# 컨테이너 제작 시 참고사항
- 원본URL: https://github.com/ferronsays/js13k-TheLastSpartan
- 기타 JS 게임: https://github.com/proyecto26/awesome-jsgames

# Dockerfile
```dockerfile
# Dockerfile
ARG NODE_VERSION=16.0.0
FROM node:${NODE_VERSION}-buster

# Create and set working directory
WORKDIR /TheLastSpartan

# Copy package files first for caching and install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variable
ENV NODE_ENV=development

# Expose the port
EXPOSE 8080

# Run the application, allowing external access
CMD ["npm", "start", "--", "--host", "0.0.0.0"]

```