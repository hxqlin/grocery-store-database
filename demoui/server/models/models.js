var connection = require('../configs/sequelize.js');

var UserMeta = require('./users');
var Users = connection.define('users', UserMeta.attributes, UserMeta.options);

var ProductMeta = require('./product');
var Product = connection.define('product', ProductMeta.attributes, ProductMeta.options);

module.exports.Users = Users;
module.exports.Product = Product;
