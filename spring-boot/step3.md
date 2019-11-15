Before you can start, you need to wait for the Kubernetes cluster to be ready (a command prompt will appear once it's ready).

`kubectl create deployment demo --image=myorg/demo --dry-run -o=yaml > deployment.yam && echo --- > deployment.yaml
&& kubectl create service clusterip demo --tcp=8080:8080 --dry-run -o=yaml >> deployment.yaml`{{execute}}

`kubectl apply -f deployment.yaml`{{execute}}

`kubectl get all`{{execute}}

```
NAME                             READY     STATUS      RESTARTS   AGE
pod/demo-658b7f4997-qfw9l        1/1       Running     0          146m

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP    2d18h
service/demo         ClusterIP   10.43.138.213   <none>        8080/TCP   21h

NAME                   READY     UP-TO-DATE   AVAILABLE   AGE
deployment.apps/demo   1/1       1            1           21h

NAME                              DESIRED   CURRENT   READY     AGE
replicaset.apps/demo-658b7f4997   1         1         1         21h
d
```

`kubectl port-forward svc/demo 8080:8080`{{execute T1}}

`curl localhost:8080/actuator/health`{{execute T2}}
