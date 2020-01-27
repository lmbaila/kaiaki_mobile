const Joi = require('@hapi/joi');

var userSchema = Joi.object().keys({
        id_user_type: Joi.number().integer().min(0).max(1).required(),
        facebook_id: Joi.string(),
        google_id: Joi.string(),
        cell: Joi.string().min(8).max(13).required(),
        password: Joi.string().min(8).pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')).required()
  });
  async function validadeUser(req, res) {
     await userSchema.validateAsync(req.body).catch(function (err) {
        return res.status(400).json(err);
    });
  }
module.exports = {validadeUser};