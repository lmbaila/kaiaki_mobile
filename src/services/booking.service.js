const knex = require('../database');
const crypto = require('../config/crypto');

function registerBooking(req, res){
    const data = req.body;
    knex('booking_tb').insert(data).then(function(result){
        return res.status(200).json({ success: true, message: 'successful booking' });
    }).catch(async (err) => {
        if(err.code == 'ER_DUP_ENTRY')
            return res.status(200).json({error: 0, massage: 'you made a booking for this property'});

        return res.status(400).send( {code: err.code} );
    });

}

module.exports = {registerBooking}