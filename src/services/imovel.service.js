const knex = require('../database');
const crypto = require('../config/crypto');
function getImovelByID(req, res) {
    try{
        const id = crypto.decript(req.params.id);
         knex('imovel_tb')
         .innerJoin('imovel_type_tb',  'imovel_tb.id_imovel_type',  'imovel_type_tb.id_imovel_type')
         .innerJoin('city_tb','city_tb.id_city','imovel_tb.id_city')
         .select('imovel_tb.id_imovel as id_imovel')
         .select('name_type', 'name_imovel','latitude', 'longitude','description_imovel','price_day', 'price_week', 'price_mouth', 'name_city', 'city_code')
         .where('imovel_tb.id_imovel', '=', `${id}`).then(function (dados) {
             const imovel = dados[0];
             imovel.id_imovel = req.params.id; 
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
module.exports = {getImovelByID}