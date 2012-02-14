#! /usr/bin/env node

var fs = require('fs');

['underscore', 'backbone'].forEach(function(lib_name){
  var original = fs.readFileSync('js/libs/'+lib_name+'/'+lib_name+'.js', 'utf8');
  var wrapper = fs.readFileSync('js/libs/'+lib_name+'/'+lib_name+'-amd-wrapper.js', 'utf8');

  var wrapped = wrapper.split('/**original**/');
  wrapped.splice(1, 0, original);
  wrapped = wrapped.join('');

  fs.writeFileSync('js/libs/'+lib_name+'/'+lib_name+'-amd.js', wrapped, 'utf8');
});
