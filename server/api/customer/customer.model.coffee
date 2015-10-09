'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

CustomerSchema = new Schema
  name:
    type: String
  email:
    type: String
    unique: true
  preferred:
    type: Schema.Types.ObjectId
    ref: 'Barber'

model = module.exports = mongoose.model 'Customer', CustomerSchema

CustomerSchema.pre 'save', (next) ->
  self = @;
  model.findOne email: @email, 'email', (err, results = {}) ->
    error = switch true
      when not self.name then 'name must be exist'
      when not self.email then 'email must be exist'
      when results.email is self.email and String(results._id) isnt String(self._id) then 'email already exist'
    if err
      next err
    else if error
      next new Error error
    else next()
