
module.exports.headerSetup = function(response){
  response.setHeader('Access-Control-Allow-Origin','*');

  console.log('header set to ' + 'Access-Control-Allow-Origin','*');
  return response;
};