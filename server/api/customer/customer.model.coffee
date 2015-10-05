'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

CustomerSchema = new Schema
  name: String
  info: String
  active: Boolean

module.exports = mongoose.model 'Customer', CustomerSchema