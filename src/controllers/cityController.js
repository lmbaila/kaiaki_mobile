const knex = require('../database');
const crypto = require('../config/crypto');
const express= require('express');
const router = express.Router();
const authMiddleware = require('../middlewares/auth');
const {getAllCity, getNeighborhoodOfCityById} = require('../services/city.service');
router.get('/', (req, res)=> {
    getAllCity(req, res);
});
router.get('/neighborhood/:id', (req, res)=> {
    getNeighborhoodOfCityById(req, res);
});

module.exports = app => app.use('/city', router);