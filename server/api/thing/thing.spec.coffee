'use strict'

chai = require 'chai'
expect = chai.expect
should = chai.should()
chaiHttp = require 'chai-http'
app = require '../../app'

chai.use chaiHttp

describe 'GET /api/things', ->
  it 'should respond with JSON array', (done) ->
    chai.request(app).get('/api/things').end (err, res) ->
      return done(err)  if err
      res.status.should.be.equal(200)
      res.headers['content-type'].should.be.match(/json/)
      res.body.should.be.instanceof Array
      done()
