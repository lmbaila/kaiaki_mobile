const express= require('express');
const authMiddleware = require('../middlewares/auth');
const knex = require('../database');
const router = express.Router();


router.get('/', async(req, res)=> {
    try{
        knex('imovel_tb').select('*').then(async(dados) => {
            return res.json(dados);
        });
    }catch(ex){

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
module.exports = app => app.use('/accommodation', router);