var Sequelize = require('sequelize');

var attributes = {
    employeeid: {
        type: Sequelize.SERIAL,
        primaryKey: true
    },
    employeename: {
        type: Sequelize.STRING
    },
    departmentname: {
        type: Sequelize.STRING
    },
    position: {
        type: Sequelize.STRING
    },
    sinumber: {
        type: Sequelize.BIGINTEGER
    },
    employeeaddress: {
        type: Sequelize.STRING
    },
    employeephone: {
        type: Sequelize.STRING
    },
    wage: {
        type: Sequelize.INTEGER
    }
};

var options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;
