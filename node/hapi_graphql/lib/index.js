/*
 * hapi_graphql
 * https://github.com/gaurav@gauravtiwari.co.uk/hapi-graphql
 *
 * Copyright (c) 2016 Gaurav Tiwari
 * Licensed under the MIT license.
 */

'use strict';

// Following the 'Node.js require(s) best practices' by
// http://www.mircozeiss.com/node-js-require-s-best-practices/

// // Nodejs libs
// var fs = require('fs');
//
// // External libs
var Hapi = require('hapi');
//
// // Internal libs
// var data = require('./data.js');

// Configurations
var config = require('./config.json');

var manifest = {
  servers: [{
    host: config.host,
    port: config.port
  }],
  plugins: config.plugins
};

if (!module.parent) {
  Hapi.Pack.compose(manifest, function (err, pack) {
    if (err) {
      console.log('Failed composing');
    } else {
      pack.start(function() {
        console.log("Servers is listening on port " + config.port);
      });
    }
  });
}

module.exports = manifest;
