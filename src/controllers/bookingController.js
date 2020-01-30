const express= require('express');
const authMiddleware = require('../middlewares/auth');
const {registerBooking} = require('../services/booking.service');
const router = express.Router();

//router.use(authMiddleware);
router.post('/register', (req, res) => {
  registerBooking(req, res);
});

module.exports = app => app.use('/booking', router);