'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

BarberSchema = new Schema
  name:
    type: String
    required: true

model = module.exports = mongoose.model 'Barber', BarberSchema

BarberSchema.pre 'save', (next) ->
  error = if not @name then 'name must be exist'
  if error
    next new Error error
  else next()
