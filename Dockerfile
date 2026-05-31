# Java 21 실행 환경을 가진 가벼운 리눅스 이미지 사용
FROM bellsoft/liberica-openjdk-alpine:21

# 컨테이너 내에서 작업할 디렉토리 설정
WORKDIR /app

# GitHub Actions가 빌드한 jar 파일을 컨테이너 내부의 app.jar로 복사
COPY ./build/libs/*.jar app.jar

# 3000번 포트 개방 (스프링 부트 application.properties 세팅도 3000번이어야 합니다)
EXPOSE 3000

# 컨테이너가 시작될 때 스프링 부트 실행
ENTRYPOINT ["java","-jar","app.jar"]