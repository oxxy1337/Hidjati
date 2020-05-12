import 'package:flutter/material.dart';
import 'Screens/User/profile.dart';
import 'Screens/home.dart';
import 'Screens/signIn.dart';
import 'Screens/signUp.dart';
import 'Screens/pick_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: pickScreen.id,
      routes: {
        pickScreen.id: (context) => pickScreen(),
        Sup.id: (context) => Sup(),
        Signinform.id: (context) => Signinform(),
        Home.id: (context) => Home(),
        Profile.id: (context) => Profile(),
      },
    );
  }
}
