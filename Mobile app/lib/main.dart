import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:school/Screens/Homevisitor.dart';
import 'package:school/Screens/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homevisitor(),
    );
  }
}
