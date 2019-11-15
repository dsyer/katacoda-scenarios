Before you can start, you need to install and start the Kubernetes cluster.

## Install Kubectl

[Kubectl](https://github.com/kubernetes/kubectl) is the command line for Kubernetes. You can install it from Google storage:

`kubectl_version="${1:-v1.15.3}" base_url="${2:-https://storage.googleapis.com/kubernetes-release/release}" \
curl -Lo kubectl ${base_url}/${kubectl_version}/bin/linux/amd64/kubectl \
&& chmod +x kubectl \
&& sudo mv kubectl /usr/local/bin/
`{{execute}}

# Download Kind

[Kind](https://github.com/kubernetes-sigs/kind) is a tool for running Kubernetes in docker. It works well for integration testing, or for simple development-time use cases, where resourecs are constrained. You can install it from github:

`
kind_version="${1:-v0.5.1}" base_url="${2:-https://github.com/kubernetes-sigs/kind/releases/download}" \
curl -Lo kind ${base_url}/${kind_version}/kind-linux-amd64 \
&& chmod +x kind
&& mv kind /usr/local/bin/`{{execute}}

and run it to create a cluster:

`kind create cluster`{{execute}}

Then set up the credentials to connect to it:

`mkdir -p ~/.kube && kind get kubeconfig > ~/.kind/config`{{execute}}

Check that it works:

`kubectl get all`{{execute}}

```
NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP    2d18h
```
