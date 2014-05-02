// victim related operations

function Victim(){
  this.db = require('./db');
}

Victim.prototype.findAll = function(callback){
  this.db.execute("select * FROM victims;",
    function(err, result, done){
      done();
      callback(err, result);
    }
  );
}

Victim.prototype.create = function(issue, callback){

};


module.exports = exports = new Victim();

