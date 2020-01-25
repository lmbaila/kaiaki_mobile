require("dotenv").config();
const crypto = require('crypto');

const secret= process.env.CRIPTO;

const encrypt = value => {
    const iv = Buffer.from(crypto.randomBytes(16))
    const cipher = crypto.createCipheriv('aes-256-cbc', Buffer.from(secret), iv)
    let encrypted = cipher.update(value)
    encrypted = Buffer.concat([ encrypted, cipher.final() ])
    return `${iv.toString('hex')}:${encrypted.toString('hex')}`
}

const decript = value => {
    const [iv, encrypt] = value.split(':')
    const ivBuffer = Buffer.from(iv, 'hex')
    const decipher = crypto.createDecipheriv('aes-256-cbc',secret, ivBuffer)
    let content = decipher.update(Buffer.from(encrypt, 'hex'))
    content = Buffer.concat([ content, decipher.final() ])  
    return content.toString()
}
module.exports = { decript, encrypt }