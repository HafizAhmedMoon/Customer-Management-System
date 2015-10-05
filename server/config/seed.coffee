###*
Populate DB with sample data on server start
to disable, edit config/environment/index.js, and set `seedDB: false`
###

'use strict'
barbers = []
Barber = require '../api/barber/barber.model'
Customer = require '../api/customer/customer.model'

getRandomBarber = () ->
  barbers[Math.floor Math.random() * barbers.length]._id

Barber.find {}
.remove ->
  barbers = [
    new Barber name: 'David'
    new Barber name: 'Sam'
    new Barber name: 'Nancy'
    new Barber name: 'Marcy'
    ]
  barber.save() for barber in barbers

Customer.find {}
.remove ->
  Customer.create
    name: 'Camille Poynor'
    email: 'Camille Poynor'
    preferred: getRandomBarber()
  ,
    name: 'Lynetta Brunette'
    email: 'Lynetta Brunette'
    preferred: getRandomBarber()
  ,
    name: 'Melinda Montandon'
    email: 'Melinda Montandon'
    preferred: getRandomBarber()
  ,
    name: 'Lavenia Constantino'
    email: 'Lavenia Constantino'
    preferred: getRandomBarber()
  ,
    name: 'Hye Vowels'
    email: 'Hye Vowels'
    preferred: getRandomBarber()
  ,
    name: 'Lisabeth Rollo'
    email: 'Lisabeth Rollo'
    preferred: getRandomBarber()
  ,
    name: 'William Chu'
    email: 'William Chu'
    preferred: getRandomBarber()
  ,
    name: 'Giovanni Surface'
    email: 'Giovanni Surface'
    preferred: getRandomBarber()
  ,
    name: 'Janie Mchugh'
    email: 'Janie Mchugh'
    preferred: getRandomBarber()
  ,
    name: 'Roxana Curfman'
    email: 'Roxana Curfman'
    preferred: getRandomBarber()
  ,
    name: 'Zena Kates'
    email: 'Zena Kates'
    preferred: getRandomBarber()
  ,
    name: 'Edward Kwiatkowski'
    email: 'Edward Kwiatkowski'
    preferred: getRandomBarber()
  ,
    name: 'Shanon Sinegal'
    email: 'Shanon Sinegal'
    preferred: getRandomBarber()
  ,
    name: 'Loria Ebright'
    email: 'Loria Ebright'
    preferred: getRandomBarber()
  ,
    name: 'Jenae Mouzon'
    email: 'Jenae Mouzon'
    preferred: getRandomBarber()
  ,
    name: 'Reta Graziano'
    email: 'Reta Graziano'
    preferred: getRandomBarber()
  ,
    name: 'Sherise Fell'
    email: 'Sherise Fell'
    preferred: getRandomBarber()
  ,
    name: 'Elizbeth Kagan'
    email: 'Elizbeth Kagan'
    preferred: getRandomBarber()
  ,
    name: 'Libby Lucy'
    email: 'Libby Lucy'
    preferred: getRandomBarber()
  ,
    name: 'Winston Reinsch'
    email: 'Winston Reinsch'
    preferred: getRandomBarber()
