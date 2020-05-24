
import 'package:flutter/material.dart';
import 'package:school/Screens/Homevisitor.dart';
import 'package:school/Screens/authenticate.dart';
import 'package:school/Screens/wrapper.dart';

void main() {
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Homevisitor(),


     );
}            
}     
           
        
        
     
  