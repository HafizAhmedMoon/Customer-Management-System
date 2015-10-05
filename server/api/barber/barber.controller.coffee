'use strict'

_ = require 'lodash'
Barber = require './barber.model'

# Get list of barbers
exports.index = (req, res) ->
  Barber.find (err, barbers) ->
    return handleError res, err  if err
    res.status(200).json barbers

# Get a single barber
exports.show = (req, res) ->
  Barber.findById req.params.id, (err, barber) ->
    return handleError res, err  if err
    return res.status(404).send 'Not Found'  if not barber
    res.json barber

# Creates a new barber in the DB.
exports.create = (req, res) ->
  Barber.create req.body, (err, barber) ->
    return handleError res, err  if err
    res.status(201).json barber

# Updates an existing barber in the DB.
exports.update = (req, res) ->
  delete req.body._id  if req.body._id
  Barber.findById req.params.id, (err, barber) ->
    return handleError res, err  if err
    return res.status(404).send 'Not Found'  if not barber
    updated = _.merge barber, req.body
    updated.save (err) ->
      return handleError res, err  if err
      res.status(200).json barber

# Deletes a barber from the DB.
exports.destroy = (req, res) ->
  Barber.findById req.params.id, (err, barber) ->
    return handleError res, err  if err
    return res.status(404).send 'Not Found'  if not barber
    barber.remove (err) ->
      return handleError res, err  if err
      res.status(204).send 'No Content'

handleError = (res, err) ->
  res.status(500).send err
