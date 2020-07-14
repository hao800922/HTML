// 呼叫套件或外掛js========================================================
const express = require('express');
const app = express();
// express起手式
// 套件express主要功用:
// 1. 簡化並取代內件套件http及其相關方法
// 2. 引入路由在適當時機取代相對路徑
// 在專案下安裝 >npm i express
// ref https://www.npmjs.com/package/express



const sha1 = require('sha1');


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

const upload_restaurant = require(__dirname + '/upload_restaurant');
// 設定multer比較複雜時, 另外用upload-module.js檔分開裝
// 用戶端上傳檔案, 會經由外掛js檔處理


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
        maxAge: 1200000000 // 最大閒置時間(msec)
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

// 模板---------------------------------------------------------
app.get('/temp', (req, res) => {
    res.render('temp')
})
// --------------------------------------------------------------

// 首頁-----------------------------------------------------
app.get('/', (req, res) => {
    res.locals.pageName = 'home';
    res.render('main');
});
//-------------------------------------------------------------

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

// 課程-------------------------------------------------------------------
app.get('/course1', (req, res) => {
    res.render('course1');
});
// --------------------------------------------------------------------------


// 產品------------------------------------------------------------------
app.get('/products', async (req, res) => {
    const sql = "SELECT * FROM products"
    const [prd] = await db.query(sql);
    res.render('products', { wine: prd });
});
// --------------------------------------------------------------------------


// 場地部分=====================================================================
// 場地頁面呈現----------------------------------------------------------------
app.get('/restaurant', async (req, res) => {

    const sql = "SELECT * FROM restaurant ORDER BY restaurant_NO DESC";
    const [r] = await db.query(sql);
    // res.json(r) // 只呈現json

    if (res.locals.sess.User && res.locals.sess.User.type == 'a') {
        return res.render('restaurant_admin', { rows: r }) // 記得這裡要用相對路徑
    }
    else if (res.locals.sess.User && res.locals.sess.User.type == 'g') {
        return res.render('restaurant_account', { rows: r }) // 記得這裡要用相對路徑
    }
    else
        res.render('restaurant', { rows: r }) // 記得這裡要用相對路徑
})
// 場地預約------------------------------------------------------------------
app.get('/restaurant_reserve/:restaurant_NO?', async (req, res) => {
    const sql1 = "SELECT * FROM `restaurant` WHERE restaurant_NO=?";
    const sql2 = "SELECT * FROM `restaurant_shoppinglist` WHERE `restaurant_NO`=? and `date` between DATE_SUB(NOW(),INTERVAL 1 day) and DATE_ADD(NOW(),INTERVAL 30 day) ORDER BY `date`"

    const [r1] = await db.query(sql1, [req.params.restaurant_NO]);
    const [r2] = await db.query(sql2, [req.params.restaurant_NO]);

    for (i = 0; i < r2.length; i++) {
        r2[i].date = moment(r2[i].date).format('YYYY-MM-DD')
    }


    if (r1.length) {
        res.render('restaurant_reserve', { rows1: r1, rows2: r2 });
    }
})


app.post('/restaurant_reserve', async (req, res) => {
    const output = {
        success: false,
        body: req.body,
    }

    const sql1 = "SELECT * FROM `restaurant_shoppinglist` WHERE `restaurant_NO` LIKE ? AND `sid` = ? AND `date` = ?";
    const sql2 = "INSERT INTO `restaurant_shoppinglist` SET ?";

    const [r1] = await db.query(sql1, [req.body.restaurant_NO, res.locals.sess.User.sid, req.body.date]);


    if (r1.length) {
        output.error = '這天餐廳已有活動舉辦';
        return res.json(output);
    }

    req.body.sid = res.locals.sess.User.sid
    req.body.status = 'u'
    const [r2] = await db.query(sql2, [req.body]);

    if (r2.affectedRows === 1 && r2.insertId) {
        output.success = true;
    }

    res.json(output);
})
// 新增場地(admin)--------------------------------------------------------------
app.get('/restaurant/add', (req, res) => {
    res.render('restaurant_add')
})

app.post('/restaurant/add', upload_restaurant.single('avatar'), async (req, res) => {
    const output = {
        success: false,
        body: req.body,
    }

    const sql = "INSERT INTO `restaurant` SET ?";
    const sql2 = "SELECT * FROM `restaurant` WHERE restaurant_NO=?";

    const [r2] = await db.query(sql2, [req.body.restaurant_NO]);

    if (r2.length) {
        output.error = '此餐廳號碼已存在';
        return res.json(output);
    }

    const [r] = await db.query(sql, [req.body]);

    if (r.affectedRows === 1) {
        output.success = true;
    }

    res.json(output);
})
// 修改餐廳(admin)-----------------------------------------------------
app.get('/restaurant/edit/:restaurant_NO', async (req, res) => {

    const sql = "SELECT * FROM `restaurant` WHERE restaurant_NO=?";
    const [r] = await db.query(sql, [req.params.restaurant_NO]);

    res.render('restaurant_edit', { rows: r[0] })
})

app.post('/restaurant/edit', upload_restaurant.single('avatar'), async (req, res) => {
    const output = {
        success: false,
        body: req.body,
        files: req.files,
    }

    const restaurant_NO = req.body.restaurant_NO;
    const sql = "UPDATE `restaurant` SET ? WHERE restaurant_NO=?";
    const [r] = await db.query(sql, [req.body, restaurant_NO]);
    if (r.changedRows === 1) {
        output.success = true;
    }
    output.r = r;
    res.json(output);
})

// 刪除餐廳------------------------------------------------------------
app.get('/restaurant/del/:restaurant_NO', async (req, res) => {
    const sql = "DELETE FROM `restaurant` WHERE restaurant_NO=?";
    const [r] = await db.query(sql, [req.params.restaurant_NO]);

    // 刪除後的轉跳畫面
    if (req.get('Referer')) {
        res.redirect(req.get('Referer'));
    } else {
        res.redirect('/');
    }
});
// ====================================================================


// 身分相關部分===============================================================
// 登入-------------------------------------------------------------------
app.get('/login', (req, res) => {
    res.render('login')
})

app.post('/login', async (req, res) => {
    const output = {
        success: false,
        info: '帳號或密碼錯誤'
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

// 登出---------------------------------------------------------------------
app.get('/logout', (req, res) => {
    delete req.session.User;
    res.send(`<script>location.href='/'</script>`);
})

// 註冊--------------------------------------------------------------------
app.get('/register', (req, res) => {
    res.render('register')
})

app.post('/register', async (req, res) => {
    const output = {
        success: false,
        body: req.body,
    }


    const sql = "INSERT INTO `register` SET ?";
    const sql1 = "SELECT * FROM `account` WHERE email=?";
    const sql2 = "SELECT * FROM `register` WHERE email=?";

    const [r1] = await db.query(sql1, [req.body.email]);
    const [r2] = await db.query(sql2, [req.body.email]);


    if (r1.length) {
        output.error = '此email已有帳號';
        return res.json(output);
    }

    if (r2.length) {
        output.error = '此email已註冊過 正待審核';
        return res.json(output);
    }

    req.body.password = sha1(req.body.password)
    req.body.type = 'g'
    const [r] = await db.query(sql, [req.body]);

    if (r.affectedRows === 1 && r.insertId) {
        output.success = true;
    }

    res.json(output);
})
//==========================================================================


// 購物車======================================================================
// 購物車_產品部分--------------------------------------------------------------

// ----------------------------------------------------------------------------


// 購物車_課程部分--------------------------------------------------------------

// ----------------------------------------------------------------------------


// 購物車_場地部分--------------------------------------------------------------
app.get('/shopping', async (req, res) => {
    const sql1 = "SELECT * FROM `restaurant`";
    const sql2 = "SELECT * FROM `restaurant_shoppinglist` WHERE `sid`=? and `status`='u' ORDER BY `date`";
    const [r2] = await db.query(sql2, [res.locals.sess.User.sid]);
    const [r1] = await db.query(sql1);

    for (i = 0; i < r2.length; i++) {
        r2[i].date = moment(r2[i].date).format('YYYY-MM-DD')
    };

    for (i = 0; i < r2.length; i++) {
        r2[i].createtime = moment(r2[i].createtime).format('YYYY-MM-DD hh:mm')
    };

    ir = []
    for (i = 0; i < r1.length; i++) {
        ir.push(r1[i].restaurant_NO)
    };

    tpr = 0
    for (i = 0; i < r2.length; i++) {
        tpr += r1[ir.indexOf(r2[i].restaurant_NO)].restaurant_price
    };

    res.render('shopping', { rows2: r2, rows1: r1, ir, tpr })
})
// 購物車場地刪除部分-----------------------------------------------------------------------
app.get('/shopping/del_restaurant/:rslid', async (req, res) => {
    const sql = "DELETE FROM `restaurant_shoppinglist` WHERE rslid=?";
    const [r] = await db.query(sql, [req.params.rslid]);

    if (req.get('Referer')) {
        res.redirect(req.get('Referer'));
    } else {
        res.redirect('/');
    }
});
//==========================================================================================


// 管理者專區部分===========================================================================
// 管理帳號部分------------------------------------------------------------------------
app.get('/admin/account', async (req, res) => {
    const sql1 = "SELECT * FROM `register` ORDER BY rid DESC"
    const [r1] = await db.query(sql1);
    for (i = 0; i < r1.length; i++) {
        r1[i].birthday = moment(r1[i].birthday).format('YYYY-MM-DD')
    };

    for (i = 0; i < r1.length; i++) {
        r1[i].createtime = moment(r1[i].createtime).format('YYYY-MM-DD hh:mm')
    };

    const sql2 = "SELECT * FROM `account` WHERE type ='g' ORDER BY sid DESC"
    const [r2] = await db.query(sql2);
    for (i = 0; i < r2.length; i++) {
        r2[i].birthday = moment(r2[i].birthday).format('YYYY-MM-DD')
    };

    for (i = 0; i < r2.length; i++) {
        r2[i].createtime = moment(r2[i].createtime).format('YYYY-MM-DD hh:mm')
    };

    const sql3 = "SELECT * FROM `account` WHERE type ='b' ORDER BY sid DESC"
    const [r3] = await db.query(sql3);
    for (i = 0; i < r3.length; i++) {
        r3[i].birthday = moment(r3[i].birthday).format('YYYY-MM-DD')
    };

    for (i = 0; i < r3.length; i++) {
        r3[i].createtime = moment(r3[i].createtime).format('YYYY-MM-DD hh:mm')
    };
    res.render('admin_account', { rows1: r1, rows2: r2, rows3: r3 })
})
// 註冊者轉為會員部分--------------------------------------------------------------------
app.get('/admin/account/add_rid/:rid', async (req, res) => {
    const sql1 = "SELECT * FROM `register` WHERE rid=?";
    const sql2 = "INSERT INTO `account` SET ?";
    const sql3 = "DELETE FROM `register` WHERE rid=?";

    const [r1] = await db.query(sql1, [req.params.rid]);
    delete r1[0].rid
    delete r1[0].createtime

    const [r2] = await db.query(sql2, [r1[0]]);

    const [r3] = await db.query(sql3, [req.params.rid]);

    if (req.get('Referer')) {
        res.redirect(req.get('Referer'));
    } else {
        res.redirect('/');
    }
});

// 刪除註冊者部分------------------------------------------------------------------------
app.get('/admin/account/del_rid/:rid', async (req, res) => {
    const sql = "DELETE FROM `register` WHERE rid=?";
    const [r] = await db.query(sql, [req.params.rid]);

    if (req.get('Referer')) {
        res.redirect(req.get('Referer'));
    } else {
        res.redirect('/');
    }
});

// 將會員加入黑名單------------------------------------------------------------------------
app.get('/admin/account/black_sid/:sid', async (req, res) => {
    const sql1 = "SELECT * FROM `account` WHERE sid=?";
    const sql2 = "UPDATE `account` SET ? WHERE sid=?";

    const [r1] = await db.query(sql1, [req.params.sid]);
    delete r1[0].sid
    delete r1[0].createtime
    r1[0].type='b'

    const [r2] = await db.query(sql2, [r1[0], req.params.sid]);

    if (req.get('Referer')) {
        res.redirect(req.get('Referer'));
    } else {
        res.redirect('/');
    }
});

// 將會員移除黑名單------------------------------------------------------------------------
app.get('/admin/account/white_sid/:sid', async (req, res) => {
    const sql1 = "SELECT * FROM `account` WHERE sid=?";
    const sql2 = "UPDATE `account` SET ? WHERE sid=?";

    const [r1] = await db.query(sql1, [req.params.sid]);
    delete r1[0].sid
    delete r1[0].createtime
    r1[0].type='g'

    const [r2] = await db.query(sql2, [r1[0], req.params.sid]);

    if (req.get('Referer')) {
        res.redirect(req.get('Referer'));
    } else {
        res.redirect('/');
    }
});

// 修改會員資料------------------------------------------------------------------------
app.get('/admin/account/edit_sid/:sid', async (req, res) => {
    const sql1 = "SELECT * FROM `account` WHERE sid=?";
    const [r1] = await db.query(sql1, [req.params.sid]);
    r1[0].birthday = moment(r1[0].birthday).format('YYYY-MM-DD')
    
    res.render('admin_account_edit',{rows1:r1});
});
app.post('/admin/account/edit_sid', async (req, res) => {
    const output = {
        success: false,
        body: req.body,
    }

    const sql = "UPDATE `account` SET ? WHERE sid =?";
    
    req.body.password = sha1(req.body.password)

    const [r] = await db.query(sql, [req.body,req.body.sid]);

    if (r.changedRows===1) {
        output.success = true;
    }

    res.json(output);
})
//==========================================================================================

// 下面禁止修改===================================================================================

app.use(express.static('public'));

app.use((req, res, next) => {
    res.status(404).send('<h2>找不到頁面</h2>')
});

app.listen(3123, () => {
    console.log('server started!');
});
