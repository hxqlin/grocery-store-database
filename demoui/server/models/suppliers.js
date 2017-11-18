var Sequelize = require('sequelize');

var attributes = {
    supplierid: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    suppliername: {
        type: Sequelize.STRING
    },
    supplierphone: {
        type: Sequelize.STRING
    },
    supplieraddress: {
        type: Sequelize.STRING
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
