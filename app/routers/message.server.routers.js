const controller = require('../controllers/messsage.server.controller');
const Router = require('koa-router');
const router = new Router(
    {
        prefix: '/message'
    }
);
router.get('/list',async (ctx, next) => {
    ctx.body = 'message list';
})

module.exports = router;