const Koa = require('koa');
const serve = require('koa-static');

const app = new Koa();

app.use(serve('static'));

// app.use(async ctx => {
//   ctx.body = 'Hello World';
// });

app.listen(3000);
