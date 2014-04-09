
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
server.get({path: PATH, version: '0.0.1'}, issue.findIssuies);
server.get({path: PATH + '/:issueId', version: '0.0.1'}, issue.findIssue);
server.post({path: PATH, version: '0.0.1'}, issue.postNewIssue);


function findIssuies(req, res, next){
  res.setHeader('Access-Control-Allow-Origin','*');
  console.log('Response to findIssuies()');
  res.send(200, {id:123456,subject:"issue subject"});

  return next();
}


module.exports = server;
