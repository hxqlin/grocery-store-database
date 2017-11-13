var connection = require('../configs/sequelize.js');

var UserMeta = require('./users');
var Users = connection.define('users', UserMeta.attributes, UserMeta.options);

var ProductMeta = require('./products');
var Products = connection.define('products', ProductMeta.attributes, ProductMeta.options);

var EmployeeMeta = require('./employees');
var Employees = connection.define('employees', EmployeeMeta.attributes, EmployeeMeta.options);

module.exports.Users = Users;
module.exports.Products = Products;
module.exports.Employees = Employees;