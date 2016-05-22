'use strict';
const compress = require('koa-compress');
const logger = require('koa-logger');
const serve = require('koa-static');
const route = require('koa-route');
const koa = require('koa');
const path = require('path');
var mount = require('koa-mount');
var convert = require('koa-convert');
var graphqlHTTP = require('koa-graphql');
var Schema = require('./api/schema');

const app = module.exports = koa();

// Logger
app.use(logger());
app.use(mount('/graphql', graphqlHTTP({ schema: Schema, graphiql: true })));

// Serve static files
app.use(serve(path.join(__dirname, 'public')));

// Compress
app.use(compress());

if (!module.parent) {
  app.listen(3000);
  console.log('listening on port 3000');
}
