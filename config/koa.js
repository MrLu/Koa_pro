const koa = require('koa');

module.exports = function() {
    const app = new koa();
    app.use(ctx => {
        ctx.body = 'Hello Koa';
    });

    require('../app/routers/message.server.routers')(app);

    return app;
}