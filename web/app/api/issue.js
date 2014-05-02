// issue related operations

function Issue(){
  this.db = require('./db');
}

Issue.prototype.findAll = function(callback){
  this.db.execute("select * from issuies;",
    function(err,result, done){
      return callback(err, result, done);
    }
  );
};

Issue.prototype.create = function(issue, callback){

};

Issue.prototype.find = function(issueId, callback){

};


module.exports = exports = new Issue();
