<pre class="file" data-filename="app.js" data-target="replace">var http = require('http');
var requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

var server = http.createServer(requestListener);
server.listen(3000, function() { console.log("Listening on port 3000")});
</pre>

Open the `pom.xml` in the editor and check that it has the actuator dependency:

<code class="copy">

        <dependency>
			    <groupId>org.springframework.boot</groupId>
			    <artifactId>spring-boot-starter-actuator</artifactId>
		    </dependency>

</code>
