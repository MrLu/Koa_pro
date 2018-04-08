const UserBase = require('../models/user_base.server.model');
const UserAuth = require('../models/user_auth.server.model');
const UserExtra = require('../models/user_extra.server.model');
const UserLocation = require('../models/user_location.server.model');

module.exports = {
    regist(ctx, next) {
        let url = new Promise((resolve, reject) => {
            ctx.mailer({
                to: '370198370@qq.com',
                subject: 'Test mail',
                text: 'It\'s just a test mail!',
                html: '<p>It\'s just a test mail!</p>',
            }, (error, info, nodemailer) => {
                if (error) {
                    console.log(error);
                    return reject(error);
                }
                let test_message_url = nodemailer.getTestMessageUrl(info);
                console.log('Message sent: %s', info.messageId);
                console.log('Preview URL: %s', test_message_url);
                resolve(test_message_url);
            });
        });
    },
    login(ctx, next) {

    },
    logout(ctx, next) {

    }
}