module.exports = {
    notFound: (req, res, next)=>{
        const error = new Error();
        error.message = 'Page Not Found 404';
        error.status = 404;
        next(error);
    },
    err: (err, req, res, next)=>{
        res.status((err.status || 500)).json({succes: false, error : err});
    },
};