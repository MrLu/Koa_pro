const Sequelize = require('sequelize');
const sequelize = require('../../../config/sequelize');
const UserAuth = sequelize.define('user_auth',{
   id: {
       type:Sequelize.BIGINT,
       primaryKey: true
   },
   uid:Sequelize.BIGINT ,
   identity_type:Sequelize.TINYINT,
   identifier:Sequelize.STRING,
   certificate:Sequelize.STRING,
   create_time:Sequelize.INTEGER,
   update_time:Sequelize.INTEGER
});

module.exports = UserAuth;