var requestListener = function (req, res) {
    res.writeHead(200);
    res.end('Hello, World!');
  }
  
  var server = http.createServer(requestListener);
  server.listen(3001, function() { console.log("Listening on port 3001")});
  