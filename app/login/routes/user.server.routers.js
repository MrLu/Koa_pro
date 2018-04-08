const controller = require('../controllers/user.server.controller');
const Router = require('koa-router');

const router = new Router(
    {
        prefix: '/user'
    }
);

router.get('/regist',async (ctx, next) => {
    controller.regist(ctx, next);
    ctx.body = 'regist';
})

module.exports = router;