const knex = require('../database');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const authConfig = require('../config/auth.json');
const crypto = require('crypto');
const Mailer = require('../modules/mailer');
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
        knex('user_tb').insert(data)
        .then( function (result) {
            return res.json({ success: true, message: 'ok' });     // respond back to request
         }).catch(function (error) {
             if(error.code == 'ER_DUP_ENTRY')
                return res.status(400).send({massage:'email or number phone have a account', error});  
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
async function findUserByEmail(req, res){
    const {mail}  = req.body;
    try{
      knex('user_tb').select('id_user', 'mail').where('mail', '=', mail).then(async(dados) => {
        const data = dados[0];

        if(!data) return res.status(400).send({error: 'email  not found'});

        const token = crypto.randomBytes(20).toString('hex'); 
        const now = new Date();
        now.setHours(now.getHours() + 1);
        knex('user_tb')
        .where('id_user', data.id_user)
        .update({ password_reset_token: token, password_reset_expires: now }).then(async (data) => {
            //return res.json(data);
            Mailer.sendMail({
                to: mail,
                from: 'oi@kaiaki.co.mz',
                subject: 'forgot_password',
                text: `recuperacao de senha token www.kaiaki.co.mz/fogot_password?auth=${token}`,
                html: `recuperacao de senha token <a href='www.kaiaki.co.mz/fogot_password?auth=${token}'>link</a>`,
            }, (err) => {
                if(err)
                   return res.status(400).send({error: 'can not send forgot password mail'});
             return res.send();
            })
        });

       });
    }catch(err){
        return res.status(400).send({error: 'Erro on fogot passoword,  try again.'});
    }
      
}
module.exports  = {createUser, login, findUserByEmail}