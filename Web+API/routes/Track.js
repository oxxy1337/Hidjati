const express = require('express');

const track = require('../middlewares/Track');

const trackRouter = express.Router();

trackRouter.route('/')
.get((req, res, next)=>{
    res.json('submit token');
});

trackRouter.route('/:trackToken')
.get(track.findUser);

module.exports = trackRouter;