const koa = require("./config/koa");
const config = require('./config/config');
const app = koa();

const views = require('koa-views');
const json = require('koa-json');
const onerror = require('koa-onerror');
const bodyparser = require('koa-bodyparser');
const logger = require('koa-logger');
const sslify = require('koa-sslify');
const mailer = require('koa-mailer-v2')

onerror(app);

app.use(bodyparser({enableTypes:['json','form','text']}));
app.use(json());
app.use(logger());
app.use(mailer(config.mailerOption))

const message = require('./app/routers/message.server.routers');
const user = require('./app/login/routes/user.server.routers');
const index = require('./app/routers/index.server.routers');
app.use(index.routes(), index.allowedMethods());
app.use(message.routes(), message.allowedMethods());
app.use(user.routes(), user.allowedMethods());

// error-handling
app.on('error', (err, ctx) => {
    console.error('server error', err, ctx)
});

module.exports = app;