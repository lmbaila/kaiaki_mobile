const express= require('express');
const authMiddleware = require('../middlewares/auth');

const { getPropertieByID, getAllpropertie, deletepropertie } = require('../services/propertie.service');
const router = express.Router();

router.get('/:id', async(req, res) => {
    getPropertieByID(req, res); 
});

router.get('/', async(req, res)=> {
    getAllpropertie(req, res);
});
router.delete('/delete', async(req, res) => {      
    deletepropertie(req, res);

});

router.use(authMiddleware);  //Todas as rotas que precisam de ser autenticadas ficam abaixo desta funcao

router.post('/register', async (req, res) => {
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