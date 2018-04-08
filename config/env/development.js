module.exports = {
    port: 7101,
    isSSL: true,
    database: {
        database: 'dic_jp',
        username: 'root',
        password: '',
        host:'',
        port: 3306 // 端口号，MySQL默认3306
    },
    mailerOption: {
        from: '15280553669@163.com',   // Define mail from address
        host: 'smtp.163.com',              // Smtp host, default: localhost
        port: 25,                      // Smtp port, default: 587
        secure: false,                  // Smtp secure, default: false
        auth: {
          type: 'login',                // Auth type, default: login
          user: '15280553669@163.com',             // Username
          pass: 'WYMrlu20180927',             // Password
        },
        logger: true,                  // Log, default: false
        debug: true,                   // Debug, default: false
        test: false,                    // Auto create test account by nodemailer.createTestAccount, default: false
    }
}