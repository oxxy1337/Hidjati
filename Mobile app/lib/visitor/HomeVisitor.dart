import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/Screens/CurvedNavigationBar.dart';
import 'package:school/Screens/signIn.dart';
import 'package:school/Screens/signUp.dart';
import 'package:school/visitor/HadjVisitor.dart';
import 'package:school/visitor/OmraVisitor.dart';
import 'package:flutter/rendering.dart';


class HomeVisitor extends StatefulWidget {
  @override
  Home_Main createState() => new Home_Main();
}

class Home_Main  extends State<HomeVisitor> {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xfff5ebec),
          color: Color(0xffaf5f63),
          items: <Widget>[

            Icon(Icons.home, size: 30),
            Icon(Icons.assignment_ind, size: 30),
            Icon(Icons.person, size: 30),

          ],
          onTap: (index) {
            if (index==1){  Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return  Sup();
                },
              ),

            );
            }
            if (index==2){  Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return  Signinform();
                },
              ),

            );
            }

          },
        ),

        body: Container(

          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Rectangle.png"),
                fit: BoxFit.cover,
              )
          ),
          child: new Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child :new IconButton(

                    icon: Image.asset('assets/images/omra.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) {
                            return new OmraVisitor();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child :new IconButton(

                    icon: Image.asset('assets/images/hadj.png'),
                    iconSize: 150,


                    onPressed: () {Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (context) {
                          return new HadjVisitor();
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













