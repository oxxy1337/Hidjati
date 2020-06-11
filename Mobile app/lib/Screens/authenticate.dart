import 'package:flutter/material.dart';
import 'package:school/Screens/signIn.dart';
import 'package:school/Screens/signUp.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

 bool showSignIn = true;
 void toggleView(){
   setState(() => showSignIn = !showSignIn);
 }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return Signinform();
    } else{
      return Sup();
    }
  }
}