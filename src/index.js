// 呼叫套件或外掛js========================================================
const express = require('express');
const app = express();
// express起手式
// 套件express主要功用:
// 1. 簡化並取代內件套件http及其相關方法
// 2. 引入路由在適當時機取代相對路徑
// 在專案下安裝 >npm i express
// ref https://www.npmjs.com/package/express

const { v4: uuidv4 } = require('uuid');
// 引入uuidv4以供使用
// 套件uuid會使用到的功用:
// uuid中的v4為創建一個超多位數亂碼, 可作為不重複的代碼
// 在專案下安裝 >npm i uuid
// ref https://www.npmjs.com/package/uuid

const session = require('express-session');
// 引入express-session
// 套件express-session功能:
// 1. 可以設定用戶端的閒置時間
// 2. 得知用戶端的session ID、查看用戶端使用資訊, e.g.登入次數、使用時間...
// 在專案下安裝 >npm i express-session
// ref https://www.npmjs.com/package/express-session

const MysqlStore = require('express-mysql-session')(session);
// 引入express-mysql-session
// 套件express-mysql-session功能:
// 存在記憶體的session資料, 備份到mysql上面
// 在專案下安裝 >npm i express-mysql-session


const moment = require('moment-timezone')
// 引入moment-timezone
// 套件moment-timezone功能:
// 可將時間套用各種格式
// 在專案下安裝 >npm i moment-timezone

const db = require(__dirname + '/db_connect');
// 呼叫外掛方式的database


const sessionStore = new MysqlStore({}, db)
// 將session存放在db之中
// 1. 記得要放在 const db 下面
// 2. 之所以有{}, 是因為全部用預設值即可


app.set('view engine', 'ejs');
// 啟動ejs_記得還要在專案下建立views資料夾
// views資料夾將成為主要存取位置,相對路徑的起始點
// 套件ejs功用:
// 1. 切割與連結一個完整html頁面, 使主架構相同的頁面, 變換內容更加容易
// 2. 跳脫以往格式的插入
// 3. views資料夾將成為主要存取位置,相對路徑的起始點
// 在專案下安裝 >npm i ejs
// vs code 記得安裝模組ESJ language support, 不然會出現語法錯誤提示
// ref https://www.npmjs.com/package/ejs

// Top-level meddleware----------------------------------------------------
app.use(express.urlencoded({ extended: false }));
// 啟動urlencoded()
// 用於form, 當用戶端以post的方式回傳queryString時, 轉匯成物件格式

app.use(express.json());
// 啟動json()
// 將讀取資料轉換成 json

app.use(session({
    secret: 'asdadftbtbre', // 亂打一串字
    saveUninitialized: false,
    resave: false,
    store: sessionStore,
    cookie: {
        maxAge: 1200000 // 最大閒置時間(msec)
        // 而如果要查詢何時斷線要用req.session.coockie.expires
    }
}));

// custom middleware----------------------------------------------------------------
// 可以預設一些全域的變數，如果用戶修改將被取代
app.use((req, res, next) => {
    res.locals.pageName = ''; // 用來active按鈕
    res.locals.email = 'null';
    res.locals.password = '0000';

    res.locals.sess = req.session;

    next()
})
//----------------------------------------------------------------------------------


//=====================================================================================================

// 模板
app.get('/temp', (req, res) => {
    res.render('temp')
})

// 首頁
app.get('/', (req, res) => {
    res.locals.pageName = 'home';
    res.render('main');
});

// 查詢網站登入次數-------------------------------------------
app.get('/try-session', (req, res) => {
    req.session.my_var = req.session.my_var || 0;
    // 一開始my_var沒有被定義, (undefined || 0)為0, 結論my_var=0
    req.session.my_var++;
    // my_var++後, my_var=1, 完成第一次計數
    //---------------------------------------------
    // 之後則是my_var=n(正整數),(n || 0)為n
    // my_var++後, my_var=n+1, 完成第n+1次計數
    //---------------------------------------------
    res.json({
        my_ver: req.session.my_var,
        session: req.session
    })
})
// my_var公式只做在這一路由, 因此只有照訪這頁, my_var才會增加
// 不過其他session資料是網站全域的
//---------------------------------------------------------------

// 課程部分-------------------------------------------------------------------
app.get('/course', (req, res) => {
    res.render('course');
});
// --------------------------------------------------------------------------

// app.post('/course', (req, res)=>{
//     res.render('course1', req.body);
//     // res.json(req.body);
// });


// 產品部分------------------------------------------------------------------
app.get('/products', (req, res) => {
    res.render('products');
});
// --------------------------------------------------------------------------

// 場地部分-----------------------------------------------------------------
app.get('/restaurant', async (req, res) => {

    const sql = "SELECT * FROM restaurant";
    const [r] = await db.query(sql);
    // res.json(r) // 只呈現json

    //-------------------------------------------------------
    res.render('restaurant', { rows: r }) // 記得這裡要用相對路徑
})
// --------------------------------------------------------------------------

// 登入部分----------------------------------------------------------------
app.get('/login', (req, res) => {
    res.render('login')
})

app.post('/login', async (req, res) => {
    const output = {
        success: false,
        info: 帳號或密碼錯誤
    };
    const sql = "SELECT * FROM account WHERE email=? AND password=SHA1(?)";
    const [result] = await db.query(sql, [req.body.email, req.body.password]);
    if (result.length) {
        req.session.User = result[0]; // 將admin匹配到的user資料丟入req.session.User
        output.success = true;
        output.info = '';
    }
    res.json(output);
})
//-------------------------------------------------------------------------

// 帳號登出------------------------------------
app.get('/logout', (req, res) => {
    delete req.session.User;
    res.send(`<script>location.href='/'</script>`);
})
//--------------------------------------------

app.get('/register', (req, res) => {
    res.render('register')
})

// 只是測試db有沒有連上線
app.get('/try-db', (req, res) => {
    const sql = "SELECT * FROM account";
    db.query(sql)
        .then(([r]) => {
            res.json(r);
        });
});
//=================================================================================================

app.use(express.static('public'));

app.use((req, res, next) => {
    res.status(404).send('<h2>找不到頁面</h2>')
});

app.listen(3123, () => {
    console.log('server started!');
});

