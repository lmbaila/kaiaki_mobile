const express = require('express');
const router = express.Router();
const {login, createUser} = require('../services/user.service');


router.post('/register', async(req, res) => {
    createUser(res, req);
});

router.post('/authenticate', async(req, res) => {
    login(req, res);
});

module.exports = app => app.use('/auth', router);