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
        from: '370198370@qq.com',   // Define mail from address
        host: 'localhost',              // Smtp host, default: localhost
        port: 587,                      // Smtp port, default: 587
        secure: ture,                  // Smtp secure, default: false
        auth: {
          type: 'login',                // Auth type, default: login
          user: 'username',             // Username
          pass: 'password',             // Password
        },
        logger: false,                  // Log, default: false
        debug: false,                   // Debug, default: false
        test: false,                    // Auto create test account by nodemailer.createTestAccount, default: false
      }
}