// Require.js allows us to configure shortcut alias
require.config({
  paths: {
    order: 'libs/require/order',
    text: 'libs/require/text',
    domReady: 'libs/require/domReady',
    jquery: 'libs/jquery/jquery',
    underscore: 'libs/underscore/underscore-amd',
    backbone: 'libs/backbone/backbone-amd'
  }
});

require([
  'jquery',
  'underscore',
  'backbone',
  'domReady'
],
function($, _, Backbone, domReady) {

  domReady(function() {

    var msg = '<p>';
    msg += 'Underscore.js version ' + _.VERSION + ' is loaded.<br />';
    msg += 'Backbone.js version ' + Backbone.VERSION + ' is loaded.<br />';
    if ($.fn) msg += 'jQuery is loaded.<br />';
    msg += '</p>';
    
    document.body.innerHTML = msg;

  });

});