tools/kind.sh
tools/kubectl.sh
kind create cluster
mkdir -p ~/.kube
kind get kubeconfig > ~/.kube/config