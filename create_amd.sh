#! /usr/bin/env node

var fs = require('fs');
var wrapped;

// Underscore
var underscore = fs.readFileSync('js/libs/underscore/underscore.js', 'utf8');
var underscore_wrapper = fs.readFileSync('js/libs/underscore/underscore-amd-wrapper.js', 'utf8');

wrapped = underscore_wrapper.split('/**original**/');
wrapped.splice(1, 0, underscore);
wrapped = wrapped.join('');

fs.writeFileSync('js/libs/underscore/underscore-amd.js', wrapped, 'utf8');


// Backbone
var backbone = fs.readFileSync('js/libs/backbone/backbone.js', 'utf8');
var backbone_wrapper = fs.readFileSync('js/libs/backbone/backbone-amd-wrapper.js', 'utf8');

wrapped = backbone_wrapper.split('/**original**/');
wrapped.splice(1, 0, backbone);
wrapped = wrapped.join('');

fs.writeFileSync('js/libs/backbone/backbone-amd.js', wrapped, 'utf8');
