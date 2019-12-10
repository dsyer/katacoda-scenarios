Quickly create a deployment manifest for the application on Kubernetes:

<pre><code class="execute">
kubectl create service demo --dry-run -o yaml > deployment.yaml
echo --- >> deployment.yaml
kubectl create deployment demo --image localhost/springguides/demo --dry-run -o yaml | egrep -v status >> deployment.yaml
</code></pre>

Let's add some configuration to the deployment for probes, as would be typical for an app using Spring Boot actuators:

<pre><code class="execute">cat >> deployment.yaml &lt;&ltEOF
        livenessProbe:
          httpGet:
            path: /actuator/info
            port: 8080
          initialDelaySeconds: 10
          periodSeconds: 3
        readinessProbe:
          initialDelaySeconds: 20
          periodSeconds: 10
          httpGet:
            path: /actuator/health
            port: 8080
EOF
</code></pre>

```
docker run -d -p 5000:5000 --name registry registry:2
```{{execute}}

```
export REGISTRY=[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com
```{{execute}}
