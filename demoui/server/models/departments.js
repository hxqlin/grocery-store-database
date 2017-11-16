var Sequelize = require('sequelize');

var attributes = {
    departmentname: {
        type: Sequelize.STRING,
        primaryKey: true
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
