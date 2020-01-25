const express = require('express');
const knex = require('../database');
const bcrypt = require('bcryptjs');
const router = express.Router();
const jwt = require('jsonwebtoken');
const authConfig = require('../config/auth.json');
const crypto = require('../config/crypto');
router.post('/register', async(req, res) => {
    try {
        const password_hash = await bcrypt.hash(req.body.password, 10);
        
        const data = {
            "id_user_type": 1,
            "facebook_id": req.body.facebook_id,
            "google_id": req.body.google_id,
            "mail": req.body.mail,
            "cell":  req.body.cell,
            "password": password_hash
        };
      // console.log(req.body);
        knex('user_tb').insert(data)
        .then( function (result) {
            return res.json({ success: true, message: 'ok'  });     // respond back to request
         }).catch(function(error) {
             if(error.code == 'ER_DUP_ENTRY')
                return res.status(400).json({ code: error.code, error: 'Duplicate entry' })
             
         });
        //return res.json(req.body);
    }catch(ex){
        return res.status(400).send({ error: 'registration failed'});
    }
});

router.post('/authenticate', async(req, res) => {
    //with email/contact and password
    const { mail, password } = req.body;
    try{
        knex('user_tb').where({ 
            mail: mail,
          }).select('*').then(async(dados) => {
           // return res.json(dados.password);
            if(!dados[0]){
                return res.status(400).send({error: 'user not found'});       
            }
  
            if(await bcrypt.compare(password, dados[0].password)){
                dados[0].password = undefined;
                
                //dados[0].id_user_type  = undefined;
                const token = jwt.sign({ id: dados[0].id_user }, authConfig.secret, {
                    expiresIn: 86400,
                });
                const userInfo = dados[0];
                return res.json({userInfo, token});
            }else{
                 return res.status(400).send({error: 'invalid password'}); 
            } 
 
          });
    } catch(ex){

    }
});

module.exports = app => app.use('/auth', router);