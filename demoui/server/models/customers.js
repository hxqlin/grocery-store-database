var Sequelize = require('sequelize');

var attributes = {
    customerid: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    customername: {
        type: Sequelize.STRING
    },
    customerphone: {
        type: Sequelize.STRING
    },
    customeremail: {
        type: Sequelize.STRING
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
