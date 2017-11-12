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
        type: Sequelize.STRING
    },
    pricepercostunit: {
        type: Sequelize.FLOAT
    },
    costunit: {
        type: Sequelize.STRING
    },
    quantityinstock: {
        type: Sequelize.INTEGER
    },
    brand: {
        type: Sequelize.STRING
    }, 
    productiondate: {
        type: Sequelize.STRING
    },
    bestbeforedate: {
        type: Sequelize.STRING
    },
    PLU: {
        type: Sequelize.INTEGER
    },
    UPC: {
        type: Sequelize.BIGINTEGER
    },
    organic: {
        type: Sequelize.INTEGER
    },
    cut: {
        type: Sequelize.STRING
    },
    animal: {
        type: Sequelize.STRING
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
