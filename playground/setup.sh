# sed -i -e 's,JAVA_HOME=.*$,JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64",' /etc/environment
mkdir demo
(cd demo; curl -L https://github.com/spring-guides/gs-spring-boot-kubernetes/archive/master.tar.gz | tar xz gs-spring-boot-kubernetes-master/complete --strip-components 2)
