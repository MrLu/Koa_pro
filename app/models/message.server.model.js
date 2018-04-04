const Sequelize = require('sequelize');
const sequelize = require('../../../config/sequelize');
const Message = sequelize.define('message',{
   id:Sequelize.BIGINT,
   title:Sequelize.STRING,
   content:Sequelize.STRING,
   create_time:Sequelize.INTEGER,
   creator_id:Sequelize.BIGINT,
   type:Sequelize.TINYINT,
   extend1:Sequelize.STRING,
   extend2:Sequelize.STRING,
   extend3:Sequelize.STRING
});

module.exports = UserLocation;