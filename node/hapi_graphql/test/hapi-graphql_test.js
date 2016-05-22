'use strict';

var Lab = require('lab'),
  Hapi = require('hapi');

var describe = Lab.experiment;
var it = Lab.test;
var expect = Lab.expect;
var before = Lab.before;
var beforeEach = Lab.beforeEach;
var after = Lab.after;

describe('hapiGraphql', function() {
  describe('composer', function() {
    var manifest;

    beforeEach(function (done) {
      // Require a new composer manifest before every test
      manifest = require('../lib/');
      done();
    });

    it('can be required without throwing', function(done) {
      expect(manifest).to.exist;
      expect(typeof manifest).to.equal('object');
      done();
    });
  });
});
