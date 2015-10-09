'use strict'

_ = require 'lodash'
Customer = require './customer.model'
Barber = require '../barber/barber.model'

# Get list of customers
exports.index = (req, res) ->
  Customer.find {}
  .populate 'preferred'
  .exec (err, customers) ->
    return errorMessage res, err.message, 500 if err
    res.json customers

# Get a single customer
exports.show = (req, res) ->
  Customer.findById req.params.id
  .populate 'preferred'
  .exec (err, customer) ->
    return errorMessage res, err.message, 500 if err
    return errorMessage res, 'Not Found', 404 if not customer
    res.json customer

# Creates a new customer in the DB.
exports.create = (req, res) ->
  Customer.create req.body, (err, customer) ->
    return errorMessage res, err.message, 500 if err
    setPreferred customer, (err) ->
      return errorMessage res, err.message, 500 if err
      res.status(201).json customer

# Updates an existing customer in the DB.
exports.update = (req, res) ->
  delete req.body._id  if req.body._id
  Customer.findById req.params.id
  .exec (err, customer) ->
    return errorMessage res, err.message, 500 if err
    return errorMessage res, 'Not Found', 404 if not customer
    updated = _.merge customer, req.body
    updated.save (err) ->
      return errorMessage res, err.message, 500 if err
      setPreferred customer, (err) ->
        return errorMessage res, err.message, 500 if err
        res.json customer

# Deletes a customer from the DB.
exports.destroy = (req, res) ->
  Customer.findById req.params.id, (err, customer) ->
    return errorMessage res, err.message, 500 if err
    return errorMessage res, 'Not Found', 404 if not customer
    customer.remove (err) ->
      return errorMessage res, err.message, 500 if err
      successMessage res, 'Customer removed'

setPreferred = (customer, cb) ->
  Barber.findById customer.preferred, (err, barber) ->
    customer.preferred = barber
    cb(err)

successMessage = (res, msg, status = 200) ->
  res.status(status).json
    success: true
    msg: msg

errorMessage = (res, msg, status = 400) ->
  res.status(status).json
    error: true
    msg: msg
