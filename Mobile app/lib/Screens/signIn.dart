import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:school/Screens/home.dart';
import 'package:school/Screens/signUp.dart';
import 'package:school/Services/User.dart';
import 'package:school/objects/ApiResponce.dart';

class Signinform extends StatefulWidget {

  @override
  createState() => SigninformState();
}

class SigninformState extends State<Signinform> {
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.fromLTRB(10, 150, 10, 0),
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
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
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
                              val.isEmpty ? 'يجب ملأ هذه الخانة' : null,
                          obscureText: true,
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
                      textColor: Color(0xffaf5f63),
                      child: Text(
                        'نسيت كلمة السر؟',
                        style: TextStyle(fontFamily: 'AeCortoba'),
                      ),
                    ),
                    Container(
                        height: 150,
                        width: 150,
                        padding: EdgeInsets.fromLTRB(50, 80, 50, 0),
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)),
                          textColor: Color(0xfff5ebec),
                          color: Color(0xffaf5f63),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'AeCortoba',
                              fontWeight: FontWeight.w300,
                              fontSize: 23,
                            ),
                          ),
                          onPressed: () async {
                            ApiResponce resp = await UserServices.loginUser(
                                nameController, passwordController);
                            if (!resp.error)
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home(resp.data)));
                            else
                              print(resp.error_msg);
                          },
                        )),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                  textColor: Color(0xffaf5f63),
                                  child: Text(
                                    'اشتراك',
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'AeCortoba'),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      new MaterialPageRoute(
                                        builder: (context) {
                                          return new Sup();
                                        },
                                      ),
                                    );
                                  }),
                              Text(
                                'ليس لديك حساب؟',
                                style: TextStyle(fontFamily: 'AeCortoba'),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
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
