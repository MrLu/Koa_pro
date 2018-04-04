const Sequelize = require('sequelize');
const sequelize = require('../../../config/sequelize');
const UserAuth = sequelize.define('user_auth',{
   id: {
       type:Sequelize.BIGINT
   },
   uid:{
        type:Sequelize.BIGINT 
   },
   identity_type:{
    type:Sequelize.TINYINT
   },
   identifier:{
    type:Sequelize.STRING
   },
   certificate:{
    type:Sequelize.STRING
   },
   create_time:{
    type:Sequelize.INTEGER
   },
   update_time:{
    type:Sequelize.INTEGER
   }
});

module.exports = UserAuth;