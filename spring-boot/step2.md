```
cat > Dockerfile << EOF
FROM openjdk:8-jdk-alpine AS builder
WORKDIR target/dependency
ARG appjar=target/*.jar
COPY ${appjar} app.jar
RUN jar -xf ./app.jar

FROM openjdk:8-jre-alpine
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY --from=builder ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=builder ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=builder ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.demo.DemoApplication"]
EOF
```{{execute}}

`docker login`{{execute}}

`export DOCKER_USERNAME=$(jq -r '.auths["https://index.docker.io/v1/"].auth' ~/.docker/config.json | base64 -d | cut -d : -f 1)`{{execute}}

`docker build -t ${DOCKER_USERNAME}/demo .`{{execute}}

`docker run -p 8080:8080 ${DOCKER_USERNAME}/demo`{{execute T1}}

`curl localhost:8080/actuator/health`{{execute T2}}

`docker push ${DOCKER_USERNAME}/demo`{{execute}}