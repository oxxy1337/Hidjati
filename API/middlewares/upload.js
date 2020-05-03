const multer = require('multer');

const imgFilter = (file, cb)=>{
    if(file.mimetype !== 'image/png' && file.mimetype !== 'image/jpeg') return cb(new Error('file not allowed'), false);
    cb(null, true);
}

const mStorage = multer.diskStorage({
    destination: (req, file, cb)=>{
        cb(null, __dirname+'/../public/img');
    },
    filename: (req, file, cb)=>{
        cb(null, Date.now()+'-'+file.originalname);
    }
});

const up = multer({
    storage: mStorage,
    fileFilter: (req, file, cb)=>{
        imgFilter(file, cb);
    },
    limits: {
        fileSize: 500*1024
    }
});

module.exports = up;
