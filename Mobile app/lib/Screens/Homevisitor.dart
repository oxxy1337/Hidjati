import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/Screens/Hadj.dart';
import 'package:school/Screens/home.dart';
import 'package:school/Screens/omra.dart';
import 'package:school/Screens/CurvedNavigationBar.dart';
import 'package:school/Screens/signIn.dart';
import 'package:school/Screens/signUp.dart';
import 'package:school/objects/User.dart';

import 'Hadj.dart';

class Homevisitor extends StatefulWidget {


  @override
  Home_visitor createState() => new Home_visitor();
}

class Home_visitor extends State<Homevisitor> {


  int count = 0;
  bool isMultiSelectStarted = false;

  void onMultiSelectStarted(int count, bool isMultiSelect) {
    print('Count: $count  isMultiSelectStarted: $isMultiSelect');
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xfff5ebec),
          color: Color(0xffaf5f63),
          items: <Widget>[

            Icon(Icons.home, size: 30),
            Icon(Icons.account_box, size: 30),
            Icon(Icons.create, size: 30),


          ],
          onTap: (index) {
            if (index==1){  Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Signinform();
                },
              ),

            );}

            if (index==2){ Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Sup();
                },
              ),

            );}
//Handle button tap
          },
        ),
        //body: Container(color: Colors.blueAccent),

        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Rectangle.png"),
                fit: BoxFit.cover,
              )),
          child: new Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new IconButton(
                    icon: Image.asset('assets/images/omra.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) {
                            return new Omra();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: new IconButton(
                    icon: Image.asset('assets/images/hadj.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) {
                            return new Hadj();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
