const multer = require('multer')
// 宣告常數multer獲得套件multer功能


const extMap = {
    'image/jpeg': '.jpg',
    'image/png': '.png',
    'image/gif': '.gif',
}
//   mimetype:.副檔名



const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, __dirname + '/../public/img')
    },         // 當前資料夾src + 退到上一層資料夾/public/img-uploads
    filename: function (req, file, cb) {
        let ext = extMap[file.mimetype];
        cb(null, req.body.products_no + ext)
        // if (ext) { cb(null, uuidv4() + ext) }   // 因為有fileFilter, 不需要以filename判斷檔案類型
        // else { cb(new Error('bad file type')) }
    }
});
// multer中diskStorage有多項功能(指定保存路徑,指定檔案名稱),
// 這時候便可引入物件寫法, 只是特別長而已
// function (req, file, cb)說明:收到用戶端的回應是上傳檔案,
// 則執行callback函數來回應用戶
// ext = extMap[file.mimetype]說明 
// e.g. 檔案如果是XXX.png, 其mimetype為image/png, 而'file.mimetype'在extMap中對應到'.png'

const fileFilter = function (req, file, cb) {
    cb(null, !!extMap[file.mimetype]);
};

const upload=multer({storage, fileFilter});
// {storage, fileFilter}依然是物件寫法, 
// 不過因為 {左邊:右邊} 左邊跟右邊一樣

module.exports=upload;