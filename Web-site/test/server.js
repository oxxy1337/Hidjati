var express = require('express');
var app = express();
var path = require('path');
var port = 80;

app.use(express.static(__dirname + '/public'));
app.use('/css',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/css')));
app.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/js')));
app.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/jquery/dist')));

app.set('views','./src/views');
app.set('view engine','ejs');
app.get('/', function(req, res) {
    res.render('index');
});

app.listen(port);