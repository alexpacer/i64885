// issue related operations
var config = require('./config');


module.exports = {
  findIssuies: function(req, res, next){
    config.headerSetup(res);
    console.log('Response to findIssuies()');
    res.send(200, {id:123456,subject:"issue subject", content: Math.random()});
    return next();
  },

  postNewIssue: function(req, res, next){

  },

  findIssue: function(req, res, next){

  }

};