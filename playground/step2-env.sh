curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-linux-amd64 && chmod +x /usr/local/bin/kind
kind create cluster

mkdir -p ~/.kube && kind get kubeconfig > ~/.kube/config

docker run -d -p 80:5000 --name registry registry:2
daemonConfig='/etc/docker/daemon.json'
jq -s '.[0] * .[1]' <( cat ${daemonConfig}) <(echo '{ "insecure-registries": [ "localhost" ] }') | sudo tee ${daemonConfig} > /dev/null
