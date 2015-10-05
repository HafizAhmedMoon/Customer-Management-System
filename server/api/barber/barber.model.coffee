'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

BarberSchema = new Schema
  name: String
  info: String
  active: Boolean

module.exports = mongoose.model 'Barber', BarberSchema