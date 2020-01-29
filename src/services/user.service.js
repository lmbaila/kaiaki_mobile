const knex = require('../database');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const authConfig = require('../config/auth.json');

async  function  createUser(req, res) {
    const password_hash = await bcrypt.hash(req.body.password, 10);
    try {
        const data = {
            "id_user_type": 1,
            "facebook_id": req.body.facebook_id,
            "google_id": req.body.google_id,
            "mail": req.body.mail,
            "cell":  req.body.cell,
            "password": password_hash
        };
       // validadeUser(data, res);
       
      // console.log(req.body);
        knex('user_tb').insert(data)
        .then( function (result) {
            return res.json({ success: true, message: 'ok' });     // respond back to request
         }).catch(function (error) {
             if(error.code == 'ER_DUP_ENTRY')
                return res.status(400).send({massage:'email or number phone have a account'});  
            return res.status(400).send({message: 'request faild'});
         });
      
    }catch(ex){
        return res.status(400).send({ error: 'registration failed'});
    }
}

async function  login(req, res) {
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
       return res.send(ex);
    }
}

module.exports  = {createUser, login}