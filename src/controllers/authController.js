const express = require('express');
const router = express.Router();
const {login, createUser} = require('../services/user.service');
const {validadeUser} = require('../middlewares/validateSchema');

router.post('/register', (req, res, next) => {
    
    validadeUser(req, res);
    
});

router.post('/authenticate', async(req, res) => {
    login(req, res);
});

module.exports = app => app.use('/auth', router);