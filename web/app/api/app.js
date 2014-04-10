var config = require('./config');
var restify = require('restify');
var server = restify.createServer({
    name : "i64885"
});

server.use(restify.queryParser());
server.use(restify.bodyParser());
server.use(restify.CORS());


// -- issue related

var issue = require('./issue');

var PATH = '/api/issuies';
server.get(
  {path: PATH, version: '0.0.1'}, 
  function(req, res, next){
    config.headerSetup(res);
    issue.findAll(function(err, r){
      res.send(200, {id:123456,subject:"issue subject", content: Math.random(), result: r});
      return next();
    });

  });

server.get(
  {path: PATH + '/:issueId', version: '0.0.1'}, 
  function(req, res, next){
    config.headerSetup(res);

    issue.find(req.issueId, function(err, result){

      return next();
    });

  });

// server.post({path: PATH, version: '0.0.1'}, issue.create);


module.exports = server;
