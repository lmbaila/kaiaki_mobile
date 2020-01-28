const knex = require('../database');
const crypto = require('../config/crypto');
const date = require('date-and-time');
const now = new Date();
var formato = date.format(now, 'YYYY-MM-DD HH:mm:ss');

function getPropertieByID(req, res) {
    try{
        const id = crypto.decript(req.params.id);
         knex('propertie_tb')
         .innerJoin('propertie_type_tb',  'propertie_tb.id_propertie_type',  'propertie_type_tb.id_propertie_type')
         .innerJoin('address_tb', 'address_tb.id_propertie','propertie_tb.id_propertie')
         .innerJoin('neighborhood_tb','neighborhood_tb.id_neighborhood','address_tb.id_neighborhood')
         .select('propertie_tb.id_propertie as id_propertie')
         .select('name_type', 'name_propertie','name_neighborhood','latitude', 'longitude','description_propertie','price_day', 'price_week', 'price_mouth', 'address' ,'name_neighborhood', 'neighbordhood_code')
         .where('propertie_tb.id_propertie', '=', `${id}`).then(function (dados) {
             const propertie = dados[0];
             propertie.id_propertie = req.params.id; 
             knex('comodide_tb')
             .innerJoin('propertie_comodide_tb',  'comodide_tb.id_comodide','=', 'propertie_comodide_tb.id_comodide')
             .select('comodide_tb.id_comodide as id_comodide')
             .select('name_comodide', 'description_comodide', 'icon')
             .where('propertie_comodide_tb.id_propertie', '=', `${id}`).orderBy('name_comodide', 'asc')
             .then(function (dados){
                 propertie.comodide = dados;
                 for(let i = 0; i < dados.length; i++){
                     propertie.comodide[i].id_comodide = crypto.encrypt(`${dados.id_comodide}`);
                 }
                 knex('photo_propertie_tb')
                 .select('id_photo_propertie', 'url', 'description_photo' , 'featured_photo')
                 .where('id_propertie', '=', `${id}`).then(function (dados) {
                     propertie.photo_propertie = dados;
                     return res.status(200).json(propertie);
                 });
                      
                 //return res.status(404).json({message: 'the propertie with the given ID was not gound', status: false});
             }).catch(function(error){
                 return res.send(error);
             });          
         }).catch(function(error) {
             return res.send(error);
         });
 
 
    } catch(error){
        if(error.code == 'ERR_OSSL_EVP_WRONG_FINAL_BLOCK_LENGTH')
          return res.status(404).send({error: 'invalid URL'});
        return res.status(400).send({error: 'request failed'});
    }
}

function getAllpropertie(req, res) {
    try{
        knex('propertie_tb').leftJoin('reting_tb',  'propertie_tb.id_propertie', 'reting_tb.id_propertie')
        .innerJoin('address_tb', 'address_tb.id_propertie','propertie_tb.id_propertie')
        .select('propertie_tb.id_propertie as id_propertie')
        .select('name_propertie', 'price_day', 'price_week','price_mouth')
        .select('address')
        .sum('desire_reting as desire_reting')
        .sum('view_reting as view_reting')
        .select('propertie_tb.created_at as created_at')
        .where('propertie_tb.deleted_at',null)
        .groupBy('propertie_tb.id_propertie')
        .orderBy('propertie_tb.created_at').then(async(dados) => {
            //crypto.encrypt(dados[0].id_propertie)
            const data = dados;
            for(let i = 0; i < dados.length; i++){
                data[i].id_propertie = crypto.encrypt(`${dados[i].id_propertie}`);
            }
            return res.status(200).json(data);
        });

    }catch(ex){
        return res.status(400).send({error: 'request failed'});
    } 
}
function deletepropertie(req, res){
    try{
        const id = crypto.decript(`${req.body.id}`);
        knex('propertie_tb')
        .where('id_propertie', '=', `${id}`)
        .andWhere('deleted_at', null)
        .update('deleted_at',`${formato}`)
        .then(async (data) => {
            if(data ===  1)
               return res.status(200).send({message: 'property deleted success full', code:data});
            return res.status(400).send({message: 'the property has already been deleted', code:data});
        }).catch((error) => {
            return res.status(400).send({error:'failed to delete the property', code: 0});
        });
    }catch(ex){
        if(!ex)
        return res.status(400).send({message: 'the property has not found'});
        
    }
}
module.exports = {getPropertieByID, getAllpropertie, deletepropertie}