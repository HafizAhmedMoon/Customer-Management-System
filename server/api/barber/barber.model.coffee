'use strict'

mongoose = require 'mongoose'
Schema = mongoose.Schema

BarberSchema = new Schema
  name:
    type: String
    required: true

module.exports = mongoose.model 'Barber', BarberSchema
