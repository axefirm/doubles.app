const jwt = require('jsonwebtoken');
const {secret} = require("../config/doubles.js");

module.exports.createtoken = async function(obj){
    return await jwt.sign(obj, secret)
  }
  