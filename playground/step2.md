Quickly create a deployment manifest for the application on Kubernetes:

<pre><code class="execute">
kubectl create service demo --dry-run -o yaml > deployment.yaml
echo --- >> deployment.yaml
kubectl create deployment demo --image localhost/springguides/demo --dry-run -o yaml | egrep -v status >> deployment.yaml
</code></pre>

Let's add some configuration to the deployment for probes, as would be typical for an app using Spring Boot actuators:

<pre><code class="execute">
$ cat >> deployment.yaml <<EOF
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