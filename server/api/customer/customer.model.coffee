'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

CustomerSchema = new Schema
  name:
    type: String
    required: true
  email:
    type: String
    required: true
  preferred:
    type: Schema.Types.ObjectId
    ref: 'Barber'

module.exports = mongoose.model 'Customer', CustomerSchema
