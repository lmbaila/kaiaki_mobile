const express= require('express');
const authMiddleware = require('../middlewares/auth');
const knex = require('../database');
const crypto = require('../config/crypto');
const { getImovelByID } = require('../services/imovel.service');
const router = express.Router();

router.get('/:id', async(req, res) => {
    getImovelByID(req, res); 
});

router.get('/', async(req, res)=> {
    
    try{
        knex('imovel_tb').leftJoin('reting_tb',  'imovel_tb.id_imovel', 'reting_tb.id_imovel')
        .select('imovel_tb.id_imovel as id_imovel')
        .select('name_imovel', 'price_day', 'price_week','price_mouth')
        .sum('desire_reting as desire_reting')
        .sum('view_reting as view_reting')
        .select('imovel_tb.created_at as created_at')
        .where('imovel_tb.deleted_at', '=', '0000-00-00 00:00:00')
        .groupBy('imovel_tb.id_imovel')
        .orderBy('imovel_tb.created_at').then(async(dados) => {
            //crypto.encrypt(dados[0].id_imovel)
            const data = dados;
            for(let i = 0; i < dados.length; i++){
                data[i].id_imovel = crypto.encrypt(`${dados[i].id_imovel}`);
            }
            return res.json(data);
        });

    }catch(ex){
        return res.status(400).send(ex);
    }
});


router.use(authMiddleware);  //Todas as rotas que precisam de ser autenticadas ficam abaixo desta funcao

router.post('/register', async (req, res) => {
    const authHeader = req.headers.authorization;
    try{
        const data = req.body;
        knex('imovel_tb').insert(data).then(function(result){
            return res.json({ success: true, message: 'ok' });
        });
    }catch(ex){
        return res.status(400).send({ error: 'registration failed' });
    }
});
module.exports = app => app.use('/imovel', router);