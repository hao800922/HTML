const express = require('express');

const app = express();

app.set('view engine', 'ejs');

const db = require(__dirname + '/db_connect');

//=====================================================================================================

app.get('/temp',(req, res)=>{
    res.render('temp')
})

app.get('/', (req, res)=>{
    res.locals.pageName = 'home';
    res.render('main', {
        name: 'project1',
    });
});

app.get('/course', (req, res)=>{
    res.render('course');
});

// app.post('/course', (req, res)=>{
//     res.render('course1', req.body);
//     // res.json(req.body);
// });

app.get('/products', (req, res)=>{
    res.render('products');
});

app.get('/restaurant',(req, res)=>{
    res.render('restaurant')
})

app.get('/login',(req, res)=>{
    res.render('login')
})

app.get('/register',(req, res)=>{
    res.render('register')
})
//=================================================================================================

app.use(express.static('public'));

app.use((req, res, next)=>{
    res.status(404).send('<h2>找不到頁面</h2>')
});

app.listen(3123, ()=>{
    console.log('server started!');
});

// test123