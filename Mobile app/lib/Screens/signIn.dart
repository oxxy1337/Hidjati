import 'dart:convert';
import 'package:school/Models/api_response.dart';

import '../Services/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:school/Screens/Succes.dart';
import './signUp.dart';
import 'package:http/http.dart' as http;
import '../Models/User.dart';
import './User/profile.dart';

import 'signUp.dart';

/*void main() {
  runApp(MaterialApp(
    home: Froute(),


  ));
}*/

/*class Froute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Signinform();
  }
}*/

class Signinform extends StatefulWidget {
  static final id = 'SigninRoute';

  final Function toggleView;
  Signinform({this.toggleView});
  @override
  createState() => SigninformState();
}

class SigninformState extends State<Signinform> {
////////////DECLARATIONS//////////////////////////
  bool _obscureText = true;
  String _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();
  String password;
  String name;
  String api = 'http://9d9d2110.ngrok.io';
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Rectangle.png"),
              fit: BoxFit.cover,
            )),
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
                      child: TextFormField(
                        autofocus: false,
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0)),
                          ),
                          labelText: 'اسم المستخدم',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'يجب ملأ هذه الخانة' : null,
                        onChanged: (val) {
                          setState(
                            () => name = val,
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
                      child: TextFormField(
                          autofocus: false,
                          //obscureText: true,

                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0)),
                            ),
                            labelText: 'كلمة السر',
                            errorStyle:
                                TextStyle(fontSize: 20.0, color: Colors.amber),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'يجب ملأ هذه الخانة' : null,
                          onChanged: (val) {
                            setState(
                              () => password = val,
                            );
                          }
                          //
                          // obscureText: _obscureText,
                          ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      textColor: Color(0xfff2b364),
                      child: Text(
                        'نسيت كلمة السر؟',
                        style: TextStyle(fontFamily: 'AeCortoba'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)),
                          textColor: Color(0xff4e7a79),
                          color: Color(0xffe3865a),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'AeCortoba',
                              fontWeight: FontWeight.w300,
                              fontSize: 23,
                            ),
                          ),
                          onPressed: () async {
                            api_response resp = await UserServices.LoginUser(
                                nameController, passwordController);
                            if (!resp.error) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          succes(resp.data.toString())));
                            } else //need to show error msg
                              print(resp.error_msg);
                          },
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
                        child: Row(
                          children: <Widget>[
                            FlatButton(
                                textColor: Color(0xfff2b364),
                                child: Text(
                                  'اشتراك',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Sup.id);
                                }),
                            Text('ليس لديك حساب؟'),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                  ],
                ))));
  }

  /*Future navigateTosignUp(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Sroute()));
         }

     // signUp() {}
    */

}
