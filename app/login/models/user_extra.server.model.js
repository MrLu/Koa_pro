const Sequelize = require('sequelize');
const sequelize = require('../../../config/sequelize');
const UserExtra = sequelize.define('user_extra', {
    uid: { 
        type: Sequelize.BIGINT, 
        primaryKey: true 
    },
    vendor: Sequelize.TINYINT,
    client_name: Sequelize.STRING,
    client_version: Sequelize.STRING,
    os_name: Sequelize.STRING,
    os_version: Sequelize.STRING,
    device_name: Sequelize.STRING,
    device_id: Sequelize.STRING,
    idfa: Sequelize.STRING,
    idfv: Sequelize.STRING,
    market: Sequelize.STRING,
    create_time: Sequelize.INTEGER,
    update_time: Sequelize.INTEGER,
    extend1: Sequelize.STRING,
    extend2: Sequelize.STRING,
    extend3: Sequelize.STRING
});

module.exports = UserExtra;