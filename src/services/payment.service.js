const knex = require('../database');
const crypto = require('../config/crypto');

// Review this source 'cause when I try register, it's give any error.
function registerPayment(req, res) {
    try{
        const data = req.body;
        knex('payment_tb').insert(data).then(function(result){
            return res.json({ success: true, message: 'ok' });
        });
    }catch(ex){
        return res.status(400).send({ error: 'registration failed' });
    }
};

function getAllPayment(req, res) {
    try{
        knex('payment_tb')
        .innerJoin('payment_type_tb',  'payment_tb.id_payment_type',  'payment_type_tb.id_payment_type')
        .innerJoin('propertie_tb',  'payment_tb.id_propertie',  'propertie_tb.id_propertie')
        .innerJoin('user_tb',  'payment_tb.id_user',  'user_tb.id_user')
        .select('payment_tb.id_payment', 'payment_tb.id_payment_type', 'payment_tb.id_propertie', 'payment_tb.id_user', 'amount', 'status', 'name_payment_type', 'description_payment_type', 'name_propertie', 'mail', 'cell')
        .then(async(dados) => {
            const data = dados;
            for(let i = 0; i < dados.length; i++){
                data[i].id_payment = crypto.encrypt(`${dados[i].id_payment}`);
            }
            return res.status(200).json(data);
        });

    }catch(ex){
        return res.status(400).send(ex);
    } 
}

function getPaymentById(req, res) {
    try{
        const id = crypto.decript(req.params.id);
        knex('payment_tb')
        .innerJoin('payment_type_tb',  'payment_tb.id_payment_type',  'payment_type_tb.id_payment_type')
        .innerJoin('propertie_tb',  'payment_tb.id_propertie',  'propertie_tb.id_propertie')
        .innerJoin('user_tb',  'payment_tb.id_user',  'user_tb.id_user')
        .select('payment_tb.id_payment', 'payment_tb.id_payment_type', 'payment_tb.id_propertie', 'payment_tb.id_user', 'amount', 'status', 'name_payment_type', 'description_payment_type', 'name_propertie', 'mail', 'cell')
        .where('payment_tb.id_payment', id)
        .then(async(dados) => {
            const data = dados;
            for(let i = 0; i < dados.length; i++){
                data[i].id_payment = crypto.encrypt(`${dados[i].id_payment}`);
            }
            return res.status(200).json(data);
        }); 
    } catch(error){
        if(error.code == 'ERR_OSSL_EVP_WRONG_FINAL_BLOCK_LENGTH')
          return res.status(404).send({error: 'invalid URL'});
        return res.status(400).send({error: 'request faild'});
    }
}


module.exports = {registerPayment, getAllPayment, getPaymentById}