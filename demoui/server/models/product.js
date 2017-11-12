var Sequelize = require('sequelize');

var attributes = {
    productid: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    departmentname: {
        type: Sequelize.STRING
    },
    productname: {
        type: Sequelize.STRING,
    },
    pricepercostunit: {
        type: Sequelize.FLOAT,
    },
    costunit: {
        type: Sequelize.STRING
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
