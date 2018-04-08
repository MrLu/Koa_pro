const Sequelize = require('sequelize');
const sequelize = require('../../../config/sequelize');
const UserBase = sequelize.define('user_base',{
   id:{
       type:Sequelize.BIGINT,
       primaryKey: true
   },
   user_role:Sequelize.TINYINT ,
   register_source:Sequelize.TINYINT,
   user_name:Sequelize.STRING,
   nick_name:Sequelize.STRING,
   gender:Sequelize.TINYINT,
   birthday:Sequelize.BIGINT,
   signature:Sequelize.STRING,
   mobile:Sequelize.STRING,
   mobile_bind_time:Sequelize.INTEGER,
   email:Sequelize.STRING,
   email_bind_time:Sequelize.INTEGER,
   avatar:Sequelize.STRING,
   avatar_src:Sequelize.STRING,
   create_time:Sequelize.INTEGER,
   update_time:Sequelize.INTEGER,
   push_token:Sequelize.STRING,
});

module.exports = UserBase;