
var restify = require('restify');
var server = restify.createServer({
    name : "i64885"
});

server.use(restify.queryParser());
server.use(restify.bodyParser());
server.use(restify.CORS());

module.exports = server;
