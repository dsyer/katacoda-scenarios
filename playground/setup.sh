# sed -i -e 's,JAVA_HOME=.*$,JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64",' /etc/environment
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
tools/kind.sh
tools/kubectl.sh
kind create cluster
mkdir -p ~/.kube
kind get kubeconfig > ~/.kube/config