Before we can start, we need to wait for the Kubernetes cluster to be ready (a command prompt will appear once it's ready).

## Create a Spring Boot Application

We can download a starter application from the start.spring.io.

`curl https://start.spring.io/starter.tgz -d dependencies=webflux,actuator -d baseDir=demo  | tar -xzvf -`{{execute}}

You can then build the application:

`cd demo && ./mvnw install`{{execute}}

and see the result (an executable JAR file):

`ls -l target/*.jar`{{execute}}

```
-rw-r--r-- 1 root root 19463334 Nov 15 11:54 target/demo-0.0.1-SNAPSHOT.jar
```

The app has some built in HTTP endpoints by virtue of the "actuator" dependency we added when we downloaded the project.