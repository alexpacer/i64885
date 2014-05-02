var config = require('./config');
var restify = require('restify');
var server = restify.createServer({
    name : "i64885"
});

server.use(restify.queryParser());
server.use(restify.bodyParser());
server.use(restify.CORS());



// -- issue related
var API_PATH = '/api';
var CURRENT_VERSION = '0.0.1';

var issue = require('./issue');

server.get(
  {path: API_PATH + '/issuies', version: CURRENT_VERSION}, 
  function(req, res, next){
    config.headerSetup(res);
    issue.findAll(function(err, r){
      res.send(200, {id:123456,subject:"issue subject", content: Math.random(), result: r});
      return next();
    });
  });

server.get(
  {path: API_PATH + '/issuies/:issueId', version: CURRENT_VERSION}, 
  function(req, res, next){
    config.headerSetup(res);
    issue.find(req.issueId, function(err, result){
      return next();
    });

  });

// ---- Victims API
var victim = require('./victim');

server.get(
  {path: API_PATH + '/victims', version: CURRENT_VERSION },
  function(req, res, next){
    
    config.headerSetup(res);
    victim.findAll(function(err, r, done){
      res.send(200, {result: r.rows, aa: "Hey ", random: Math.random()});
      return next();
    });

  }
);

server.post(
  {path: API_PATH + '/victims', version: CURRENT_VERSION },
  function(req, res, next){
    config.headerSetup(res);
    console.log(req);
    victim.create(req, function(err, r, done){
      res.send(200, {status: "done"});
      return next();
    })
  }
);

module.exports = server;
