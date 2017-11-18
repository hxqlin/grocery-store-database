var connection = require('../configs/sequelize.js');

var UserMeta = require('./users');
var Users = connection.define('users', UserMeta.attributes, UserMeta.options);

var ProductMeta = require('./products');
var Products = connection.define('products', ProductMeta.attributes, ProductMeta.options);

var EmployeeMeta = require('./employees');
var Employees = connection.define('employees', EmployeeMeta.attributes, EmployeeMeta.options);

var CustomerMeta = require('./customers');
var Customers = connection.define('customers', CustomerMeta.attributes, CustomerMeta.options);

var DepartmentsMeta = require('./departments');
var Departments = connection.define('departments', DepartmentsMeta.attributes, DepartmentsMeta.options);

var AislesMeta = require('./aisles');
var Aisles = connection.define('aisles', AislesMeta.attributes, AislesMeta.options);

var SuppliersMeta = require('./suppliers');
var Suppliers = connection.define('suppliers', SuppliersMeta.attributes, SuppliersMeta.options);

module.exports.Users = Users;
module.exports.Products = Products;
module.exports.Employees = Employees;
module.exports.Customers = Customers;
module.exports.Departments = Departments;
module.exports.Aisles = Aisles;
module.exports.Suppliers = Suppliers;