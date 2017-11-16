var Sequelize = require('sequelize');

var attributes = {
    aislenumber: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    aislename: {
        type: Sequelize.STRING
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
