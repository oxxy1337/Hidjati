import 'package:flutter/material.dart';
import './User/profile.dart';
import 'signIn.dart';
import 'signUp.dart';
import '../Services/test_services.dart';

class pickScreen extends StatefulWidget {
  static final id = 'PickscreenRoute';
  @override
  _pickScreenState createState() => _pickScreenState();
}

class _pickScreenState extends State<pickScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          child: Text('Home'),
          onPressed: () => {Test.printresults()},
        ),
        MaterialButton(
          child: Text('signin'),
          onPressed: () => {Navigator.pushNamed(context, Signinform.id)},
        ),
        MaterialButton(
          child: Text('signup'),
          onPressed: () => {Navigator.pushNamed(context, Sup.id)},
        ),
        MaterialButton(
          child: Text('getUser'),
          onPressed: () => {Navigator.pushNamed(context, Profile.id)},
        )
      ],
    );
  }
}
