import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:school/Screens/home.dart';
import 'package:school/objects/ApiResponce.dart';
import 'signIn.dart';
import 'package:school/Services/User.dart';

class Sup extends StatefulWidget {

  @override
  createState() => SupState();
}

class SupState extends State<Sup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String name;
  String sexe;

  var gender = ['ذكر', 'انثى', 'الجنس'];
  var gselected = 'الجنس';
  @override
  Widget build(BuildContext context) {
    var validators;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Rectangle1.png"),
              fit: BoxFit.cover,
            )),
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 140, 20, 0),
                      child: TextFormField(
                        autofocus: false,
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0)),
                          ),
                          labelText: 'اسم المستخدم',
                        ),
                        /*validator: validators.composer([
                           validators.required('يجب ملأ هذه الخانة'),
                           validators.email('خطأ في ادخال اسم المستخدم'),
                        ]),*/
                        validator: (val) =>
                            val.isEmpty ? 'يجب ملأ هذه الخانة' : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        autofocus: false,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0)),
                          ),
                          labelText: 'البريد الالكتروني',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'يجب ملأ هذه الخانة' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        autofocus: false,
                        //obscureText: true,

                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0)),
                          ),
                          labelText: 'كلمة السر',
                          errorStyle:
                              TextStyle(fontSize: 20.0, color: Colors.amber),
                        ),

                        validator: (val) =>
                            val.length < 6 ? 'على الاقل 6 حروف' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val,);
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        margin: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                style: BorderStyle.solid, width: 0.5),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(50.0)),
                          ),
                        ),
                        child: DropdownButton(
                          underline: Container(),
                          items: gender.map((String selectItem) {
                            return DropdownMenuItem<String>(
                              value: selectItem,
                              child: new Text(selectItem),
                            );
                          }).toList(),
                          onChanged: (String thegender) {
                            setState(() {
                              gselected = thegender;
                              sexe = thegender == 'ذكر' ? 'male' : 'female';
                            });
                          },
                          value: gselected,
                        )),
                    Container(
                        height: 90,
                        width: 90,
                        padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)),
                          textColor: Color(0xfff5ebec),
                          color: Color(0xffaf5f63),
                          child: Text(
                            'تسجيل ',
                            style: TextStyle(
                              fontFamily: 'AeCortoba',
                              fontWeight: FontWeight.w300,
                              fontSize: 23,
                            ),
                          ),
                          onPressed: () async {
                            ApiResponce resp = await UserServices.registerUser(
                                nameController,
                                emailController,
                                sexe,
                                passwordController);
                            if (!resp.error) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home(resp.data)));
                            } else
                              print(resp.error_msg);
                            /*if (_formKey.currentState.validate()) print(email);
                            print(password);*/
                          },
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
                        child: Row(
                          children: <Widget>[
                            FlatButton(
                              textColor: Color(0xffaf5f63),
                              child: Text(
                                'دخول',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'AeCortoba'),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  new MaterialPageRoute(
                                    builder: (context) {
                                      return new Signinform();
                                    },
                                  ),
                                );
                              },
                            ),
                            Text(' لديك حساب؟',
                                style: TextStyle(fontFamily: 'AeCortoba')),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                  ],
                ))));
  }
}
