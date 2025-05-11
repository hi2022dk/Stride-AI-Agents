# 1) n8n 공식 이미지를 베이스로
FROM n8nio/n8n:latest

# 2) 루트 권한으로 Python3 설치
USER root
RUN apk add --no-cache python3 py3-pip

# 3) node 권한으로 복귀
USER node
WORKDIR /home/node

# 4) 환경변수 파일 복사(.env.example → .env 로 이름 변경해도 OK)
COPY .env.example .env

# 5) n8n 워크플로우 백업 폴더 복사
COPY n8n/ ./n8n

# 6) Python 스크립트 복사 (예시 폴더명)
COPY python-scripts/ ./python-scripts

# 7) 포트 설정(기본 5678)
EXPOSE 5678

# 8) 컨테이너 기동 시 n8n 실행
CMD ["n8n", "start"]
