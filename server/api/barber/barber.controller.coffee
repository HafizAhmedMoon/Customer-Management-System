'use strict'

_ = require 'lodash'
Barber = require './barber.model'

# Get list of barbers
exports.index = (req, res) ->
  Barber.find (err, barbers) ->
    return errorMessage res, err.message, 500 if err
    res.json barbers

# Get a single barber
exports.show = (req, res) ->
  Barber.findById req.params.id, (err, barber) ->
    return errorMessage res, err.message, 500 if err
    return errorMessage res, 'Not Found', 404 if not barber
    res.json barber

# Creates a new barber in the DB.
exports.create = (req, res) ->
  Barber.create req.body, (err, barber) ->
    return errorMessage res, err.message, 500 if err
    res.status(201).json barber

# Updates an existing barber in the DB.
exports.update = (req, res) ->
  delete req.body._id  if req.body._id
  Barber.findById req.params.id, (err, barber) ->
    return errorMessage res, err.message, 500 if err
    return errorMessage res, 'Not Found', 404 if not barber
    updated = _.merge barber, req.body
    updated.save (err) ->
      return errorMessage res, err.message, 500 if err
      res.status(200).json barber

# Deletes a barber from the DB.
exports.destroy = (req, res) ->
  Barber.findById req.params.id, (err, barber) ->
    return errorMessage res, err.message, 500 if err
    return errorMessage res, 'Not Found', 404 if not barber
    barber.remove (err) ->
      return errorMessage res, err.message, 500 if err
      successMessage res, 'Barber removed'

successMessage = (res, msg, status = 200) ->
  res.status(status).json
    success: true
    msg: msg

errorMessage = (res, msg, status = 400) ->
  res.status(status).json
    error: true
    msg: msg
