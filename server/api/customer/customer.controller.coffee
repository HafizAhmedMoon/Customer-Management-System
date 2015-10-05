'use strict'

_ = require 'lodash'
Customer = require './customer.model'

# Get list of customers
exports.index = (req, res) ->
  Customer.find (err, customers) ->
    return handleError res, err  if err
    res.status(200).json customers

# Get a single customer
exports.show = (req, res) ->
  Customer.findById req.params.id, (err, customer) ->
    return handleError res, err  if err
    return res.status(404).send 'Not Found'  if not customer
    res.json customer

# Creates a new customer in the DB.
exports.create = (req, res) ->
  Customer.create req.body, (err, customer) ->
    return handleError res, err  if err
    res.status(201).json customer

# Updates an existing customer in the DB.
exports.update = (req, res) ->
  delete req.body._id  if req.body._id
  Customer.findById req.params.id, (err, customer) ->
    return handleError res, err  if err
    return res.status(404).send 'Not Found'  if not customer
    updated = _.merge customer, req.body
    updated.save (err) ->
      return handleError res, err  if err
      res.status(200).json customer

# Deletes a customer from the DB.
exports.destroy = (req, res) ->
  Customer.findById req.params.id, (err, customer) ->
    return handleError res, err  if err
    return res.status(404).send 'Not Found'  if not customer
    customer.remove (err) ->
      return handleError res, err  if err
      res.status(204).send 'No Content'

handleError = (res, err) ->
  res.status(500).send err
