require.config({
  paths: {
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