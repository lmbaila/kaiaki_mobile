const knex = require('../database');
const crypto = require('../config/crypto');
function getCityByID(req, res) {
    try{
        const id = crypto.decript(req.params.id);
         knex('city_tb')
         .innerJoin('neighborhood_tb','neighborhood_tb.id_city','city_tb.id_city')
         .select('city_code', 'name_city','neighbordhood_code', 'name_neighborhood')
         .where('city_tb.id_city', '=', `${id}`).then(function (dados) {
             const city = dados[0];
             city.id_city = req.params.id; 
             knex('comodide_tb')
             .innerJoin('imovel_comodide_tb',  'comodide_tb.id_comodide','=', 'imovel_comodide_tb.id_comodide')
             .select('comodide_tb.id_comodide as id_comodide')
             .select('name_comodide', 'description_comodide', 'icon')
             .where('imovel_comodide_tb.id_imovel', '=', `${id}`).orderBy('name_comodide', 'asc')
             .then(function (dados){
                 imovel.comodide = dados;
                 for(let i = 0; i < dados.length; i++){
                     imovel.comodide[i].id_comodide = crypto.encrypt(`${dados.id_comodide}`);
                 }
                 knex('photo_imovel_tb')
                 .select('id_photo_imovel', 'url', 'description_photo' , 'featured_photo')
                 .where('id_imovel', '=', `${id}`).then(function (dados) {
                     imovel.photo_imovel = dados;
                     return res.status(200).json(imovel);
                 });
                      
                 //return res.status(404).json({message: 'the imovel with the given ID was not gound', status: false});
             }).catch(function(error){
                 return res.send(error);
             });          
         }).catch(function(error) {
             return res.send(error);
         });
 
 
    } catch(error){
        if(error.code == 'ERR_OSSL_EVP_WRONG_FINAL_BLOCK_LENGTH')
          return res.status(404).send({error: 'invalid URL'});
        return res.status(400).send({error: 'request faild'});
    }
}

function getAllCity(req, res) {
    try{
        knex('city_tb').leftJoin('neighborhood_tb',  'city_tb.id_city', 'neighborhood_tb.id_city')
        .select('city_code', 'name_city','neighbordhood_code', 'name_neighborhood')
        .select('city_tb.created_at as created_at')
        .where('city_tb.deleted_at', '=', '0000-00-00 00:00:00')
        .groupBy('city_tb.id_city')
        .orderBy('city_tb.created_at').then(async(dados) => {
            const data = dados;
            for(let i = 0; i < dados.length; i++){
                data[i].id_city = crypto.encrypt(`${dados[i].id_city}`);
            }
            return res.status(200).json(data);
        });

    }catch(ex){
        return res.status(400).send(ex);
    } 
}
module.exports = {getImovelByID, getAllImovel}