const knex = require('../database');
const crypto = require('../config/crypto');
const express= require('express');
const router = express.Router();
const authMiddleware = require('../middlewares/auth');
const {registerPayment, getAllPayment, getPaymentById} = require('../services/payment.service');

router.post('/register', (req, res)=> {
    registerPayment(req, res);
});

router.get('/', (req, res)=> {
    getAllPayment(req, res);
});

router.get('/:id', (req, res)=> {
    getPaymentById(req, res);
});

module.exports = app => app.use('/payment', router);