'use strict';
const compress = require('koa-compress');
const logger = require('koa-logger');
const koa = require('koa');
const path = require('path');
var mount = require('koa-mount');
var convert = require('koa-convert');
var graphqlHTTP = require('koa-graphql');
var Schema = require('./api/schema');

const app = module.exports = koa();

// Logger
app.use(logger());
app.use(mount('/', graphqlHTTP({ schema: Schema, graphiql: true })));

// Compress
app.use(compress());

if (!module.parent) {
  app.listen(3000);
  console.log('listening on port 3000');
}
