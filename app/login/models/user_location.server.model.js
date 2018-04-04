const Sequelize = require('sequelize');
const sequelize = require('../../../config/sequelize');
const UserLocation = sequelize.define('user_location',{
   uid:Sequelize.BIGINT,
   curr_nation:Sequelize.TINYINT ,
   curr_province:Sequelize.STRING,
   curr_city:Sequelize.STRING,
   curr_district:Sequelize.STRING,
   location:Sequelize.STRING,
   longitude:Sequelize.STRING,
   latitude:Sequelize.STRING,
   update_time:Sequelize.INTEGER
});

module.exports = UserLocation;