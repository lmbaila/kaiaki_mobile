//const Joi = require('@hapi/joi');
const Joi = require('joi');
var userSchema = Joi.object().keys({
        id_user_type: Joi.number().integer().min(1).max(2).required().error(() => {return {message: 'o Campo nao foi identificado'}}),
        facebook_id: Joi.string(),
        google_id: Joi.string(),
        mail: Joi.string().email().required().error(errors => {
          errors.forEach(err => {
            switch (err.type) {
              case "any.empty":
                err.message = "o campo email e requerido";
                break;
              case "string.min":
                err.message = `O campo aceita no minimo ${err.context.limit} caracteres!`;
                break;
                case "string.email":
                  err.message = `informe um email valido!`;
                  break;
              case "string.max":
                err.message = `O campo aceita no maximo  ${err.context.limit} caracteres!`;
                break;
              default:
                break;
            }
          });
          return errors;
        }),
        cell: Joi.string().min(9).max(13).required().error(errors => {
          errors.forEach(err => {
            switch (err.type) {
              case "any.empty":
                err.message = "o numero de celular e requerido!";
                break;
                case "string.min":
                  err.message = "verifique a quantidade de caracteres!";
                  break;
                  case "string.max":
                    err.message = "Formato para numero de celular invalido!";
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
      }
    });
  }




   
module.exports = {validadeUser}