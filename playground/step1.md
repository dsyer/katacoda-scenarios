<pre class="file" data-filename="app.js" data-target="replace">var http = require('http');
var requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

var server = http.createServer(requestListener);
server.listen(3000, function() { console.log("Listening on port 3000")});
</pre>

Open the `demo/pom.xml`{{open}} in the editor and check that it has the actuator dependency:

```
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```{{copy}}

<pre><code class="copy">&lt;dependency>
  &lt;groupId>org.springframework.boot&lt;/groupId>
  &lt;artifactId>spring-boot-starter-actuator&lt;/artifactId>
&lt;/dependency>
</code></pre>

```
<properties>
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
  <java.version>1.8</java.version>
</properties>
```{{copy}}