var pg = require('pg');
var _ = require('underscore');
var util = require('../util');


// database accessor

function Db(){
  this.connString = process.env['i64885_CONNECTION_STRING'];
}

Db.prototype.execute = function(sql, params, callback){
  // this seems to be paramaterized query.
  if(_.isArray(params) && _.isString(sql)){ 
    pg.connect(this.connString, function(err, client, done){
      if(err){
        return console.error("error connecting client from pool ", err);
      }
      client.query(sql, params, function(err, result){
        if(err){ return console.error("error executing query ", err); }
        callback(err, result);
      });
    });
  }else{
    pg.connect(this.connString, function(err, client, done){
      if(err){
        return console.error("error connecting client from pool ", err);
      }
      client.query(sql, function(err, result){
        if(err){ return console.error("error executing query ", err); }

        if(_.isFunction(params)){
          params(err, result);
        }else{
          callback(err, result);
        }
        
      });
    });
  }
};

module.exports = exports = new Db();