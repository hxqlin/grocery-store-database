var connection = require('../configs/sequelize.js');

var UserMeta = require('./users');
var Users = connection.define('users', UserMeta.attributes, UserMeta.options);

var ProductMeta = require('./users');
var Product = connection.define('users', ProductMeta.attributes, ProductMeta.options);

module.exports.Users = Users;
module.exports.Users = Product;
