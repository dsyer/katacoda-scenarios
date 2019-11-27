Before you can start, you need to install and start the Kubernetes cluster.

Check that you have a Kubernetes cluster running:

`kubectl get all`{{execute}}

```
NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP    2d18h
```

Now we can deploy our Spring Boot application.