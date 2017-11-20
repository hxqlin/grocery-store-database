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
        type: Sequelize.INTEGER,
        defaultValue: NULL
    },
    brand: {
        type: Sequelize.STRING,
        defaultValue: NULL
    }, 
    productiondate: {
        type: Sequelize.STRING,
        defaultValue: NULL
    },
    bestbeforedate: {
        type: Sequelize.STRING,
        defaultValue: NULL
    },
    PLU: {
        type: Sequelize.INTEGER,
        defaultValue: NULL
    },
    UPC: {
        type: Sequelize.BIGINTEGER,
        defaultValue: NULL
    },
    organic: {
        type: Sequelize.INTEGER,
        defaultValue: NULL
    },
    cut: {
        type: Sequelize.STRING,
        defaultValue: NULL
    },
    animal: {
        type: Sequelize.STRING,
        defaultValue: NULL
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
