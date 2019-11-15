```
cat > Dockerfile << EOF
FROM openjdk:8-jdk-alpine AS builder
WORKDIR target/dependency
ARG appjar=target/*.jar
COPY \${appjar} app.jar
RUN jar -xf ./app.jar

FROM openjdk:8-jre-alpine
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY --from=builder \${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=builder \${DEPENDENCY}/META-INF /app/META-INF
COPY --from=builder \${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.demo.DemoApplication"]
EOF
```
{{execute}}

`docker build -t dsyer/demo .`{{execute}}

`docker run -p 8080:8080 dsyer/demo`{{execute T1}}

`curl localhost:8080/actuator/health`{{execute T2}}

You won't be able to run this one unless you authenticate with Dockerhub (`docker login`), but there's an image there already that should work:

`docker push dsyer/demo`

The image needs to be pushed to Dockerhub (or some other accessible repository) because Kubernetes pulls the image from inside its Kubelets (nodes), which are not in general connected to the local docker daemon.

> NOTE: Just for testing, there are workarounds that make `docker push` work with an insecure local registry, for instance, but that is out of scope for this scenario.