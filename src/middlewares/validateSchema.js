//const Joi = require('@hapi/joi');
const {login, createUser} = require('../services/user.service');
const Joi = require('joi');
var userSchema = Joi.object().keys({
        id_user_type: Joi.number().integer().min(1).max(2).required().error(() => {return {message: 'o Campo nao foi identificado'}}),
        facebook_id: Joi.string(),
        google_id: Joi.string(),
        mail: Joi.string().regex(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/).min(4).max(75).email().required().error(errors => {
          errors.forEach(err => {
            switch (err.type) {
              case "any.empty":
                err.message = "o campo email e requerido!";
                break;
              case "string.min":
                err.message = `informe um email valido!`;
                break;
                case "string.email":
                  err.message = `informe um email valido!`;
                  break;
              case "string.max":
                err.message = `informe um email valido!`;
                break;
                case "string.regex.base":
                  err.message = `Formato de email incorrecto!`;
                  break;
              default:
                break;
            }
          });
          return errors;
        }),
        cell: Joi.string().regex(/^[0-9]*$/).min(9).max(13).required().error(errors => {
          errors.forEach(err => {
            switch (err.type) {
              case "any.empty":
                err.message = "o numero de celular e requerido!";
                break;
              case "string.min":
                err.message = "numero de digitos invalidos!";
                break;
              case "string.max":
                err.message = "numero de digitos invalidos!";
                break;
              case "string.regex.base":
                err.message = "celular nao pode conter letras";
                break;
              default:
                break;
            }
          });
          return errors;
        }),

        password: Joi.string().min(8).max(35).required().error(errors => {
          errors.forEach(err => {
            switch (err.type) {
              case "any.empty":
                err.message = "A senha nao pode ser vazia!";
                break;
              case "string.base":
                err.message = `informe uma senha`;
                break;
              case "string.min":
                err.message = `O campo aceita no minimo  ${err.context.limit} caracteres!`;
                break;
                case "string.max":
                  err.message = `O campo aceita no minimo  ${err.context.limit} caracteres!`;
                  break;
              default:
                break;
            }
          });
          return errors;
        })
  });

  function validadeUser(req, res) {
    Joi.validate(req.body, userSchema, (err, value) => {

      if (err) {
          res.status(422).json({ err });
      }else{
        createUser(req, res);
      }
    });
  }




   
module.exports = {validadeUser}