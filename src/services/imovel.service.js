const knex = require('../database');

module.exports = {
   selectAll:(data, callback) => {
    try{
        knex('imovel_tb')
        
        .select('*').then(async(dados) => {
            return  dados ;
        });
    }catch(ex){
        return  ex;
    }
   }

  
}