require('dotenv').config();

const mailer = require('nodemailer');
const jwt = require('jsonwebtoken');

const transporter = mailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.MAILER_USER,
        pass: process.env.MAILER_PASS
    }
});

module.exports = {
    sendEmailConfirmation : (req, res, user)=>{
        jwt.sign({userId: user._id}, process.env.CONFIRMATION_SECRET, {expiresIn: '24h'}, (err, Token)=>{
            const url = `http://localhost:3000/confirmation/${Token}`;
            const mailOptions = {
                from: process.env.MAILER_USER,
                to: user.email,
                subject: 'Account confirmation',
                html: `Hello ${user.username}, confirm your acocunt <a href="${url}">Here.</a> `
                };
            transporter.sendMail(mailOptions, (err, info)=>{
                const msg = (!err) ? 'email sent' : 'mailer err';
                res.status(200).json({succes:true, data: user, message: msg, mailerErr: err});
            });
        });
    },
    sendEmailResetPassword: (req, res, user)=>{
        jwt.sign({userId: user._id}, process.env.RESETPASS_SECRET, {expiresIn: '1h'}, (err, Token)=>{
            const url = `http://localhost:3000/resetpassword/${Token}`;
            const mailOptions = {
                from: process.env.MAILER_USER,
                to: user.email,
                subject: 'Password reset',
                html: `Hello ${user.username}, reset your password <a href="${url}">Here.</a> `
                };
            transporter.sendMail(mailOptions, (err, info)=>{
                const msg = (!err) ? 'email sent' : 'mailer err';
                res.status(200).json({succes: true, data: user, message: msg, mailerErr: err});
            });
        });
    }
};