// Creates restify server instance listening on port 3000
var server = require('./app.js');
var ip_addr = 'localhost';
var port    = '3000';
server.listen(port, ip_addr, function(){
  console.log('%s listening at %s ', server.name, server.url);
}); 