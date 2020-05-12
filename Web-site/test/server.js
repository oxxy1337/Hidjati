var express = require('express');
var app = express();
var path = require('path');
var port = 3000;


app.use(express.static(__dirname + '/public'));
app.use('/css',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/css')));
app.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/js')));
app.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/jquery/dist')));

app.set('views','./src/views');
app.set('view engine','ejs');


app.get('/', function(req, res) {
    res.render('index');
});
app.get('/Go',function(req2,res2){
    res2.render('GuideOmra');
});
app.get('/Gh',function(req3,res3){
    res3.render('GuideHadj');
});
app.get('/Login',function(req4,res4){
    res4.render('Login');
});
app.get('/SignUp',function(req5,res5){
    res5.render('SignUp');
});

app.listen(port);