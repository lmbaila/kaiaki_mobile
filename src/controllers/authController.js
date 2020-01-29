const express = require('express');
const router = express.Router();
const {login, findUserByEmail} = require('../services/user.service');
const {validadeUser} = require('../middlewares/validateSchema');

router.post('/register', (req, res, next) => {
    
    validadeUser(req, res);
    
});

router.post('/authenticate', async(req, res) => {
    login(req, res);
});
router.post('/fogot_password', async(req, res) => {
    findUserByEmail(req, res);
});

module.exports = app => app.use('/auth', router);