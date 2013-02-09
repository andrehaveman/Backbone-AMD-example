## Important!

Since RequireJS 2.0 this example is not relevant anymore. You can use the shim configruation of RequireJS to load Backbone and Underscore. See http://requirejs.org/docs/api.html#config-shim for more information.

# Backbone AMD

Example of using Backbone.js, Underscore.js and jQuery together with RequireJS. It uses wrappers for Backbone and Underscore. The latest releases for Backbone.js and Underscore.js don't support AMD by default, but it is easy to make them AMD compatible without changing the code of Backbone.js and Underscore.js itself.

## Underscore.js wrapper

Wrapping Underscore.js is simple. Just a RequireJS CommonJS wrapper does the job:

    // Underscore.js AMD wrapper
    define(function(require, exports, module){

    // start Underscore /////////////////////////////////////////////////////////

    // Underscore.js code here

    // end Underscore ///////////////////////////////////////////////////////////

    });

## Backbone.js wrapper

Backbone is a bit more complicated. Backbone itself is wrapped in a function that is called with *this* as scope. In a module we don't want this to be the window object. To solve this a new 'scope' is created by wrapping Backbone in another anonymous function that is called with our custom created scope, which contains the '_' and 'jQuery' properties.

    // Backbone.js AMD wrapper
    define([
      'exports',
      'underscore',
      'jquery'
    ],
    function(exports, _, jQuery) {

      var scope = {
        '_': _,
        'jQuery': jQuery
      };


      (function() {

    // start Backbone /////////////////////////////////////////////////////////////

    // Backbone.js code here

    // end Backbone ///////////////////////////////////////////////////////////////

      }).call(scope);
    });

# Using Backbone, Underscore and jQuery modules in your code

In this example the main.js file contains configured shortcuts to jQuery, Backbone and Underscore:

    require.config({
      paths: {
        jquery: 'libs/jquery/jquery',
        underscore: 'libs/underscore/underscore-amd',
        backbone: 'libs/backbone/backbone-amd'
      }
    });

    require([
      'jquery',
      'underscore',
      'backbone'
    ],
    function($, _, Backbone) {

        // your application code here.

    });