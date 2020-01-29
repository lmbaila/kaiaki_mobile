const knex = require('../database');
const crypto = require('../config/crypto');
function getAllCity(req, res) {
    try{
        knex('city_tb')
       .select('id_city', 'city_code', 'name_city')
        .then(async(dados) => {
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

function getNeighborhoodOfCityById(req, res) {
    try{
        const id = crypto.decript(req.params.id);
        knex('city_tb')
        .innerJoin('neighborhood_tb', 'city_tb.id_city', 'neighborhood_tb.id_city')
       .select('id_neighborhood', 'neighbordhood_code', 'name_neighborhood')
       .where('city_tb.id_city', id)
        .then(async(dados) => {
            const data = dados;
            for(let i = 0; i < dados.length; i++){
                data[i].id_neighborhood = crypto.encrypt(`${dados[i].id_neighborhood}`);
            }
            return res.status(200).json(data);
        }); 
    } catch(error){
        if(error.code == 'ERR_OSSL_EVP_WRONG_FINAL_BLOCK_LENGTH')
          return res.status(404).send({error: 'invalid URL'});
        return res.status(400).send({error: 'request faild'});
    }
}


module.exports = {getAllCity,getNeighborhoodOfCityById}