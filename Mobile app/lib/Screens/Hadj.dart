import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:school/Screens/DummyDataHadj.dart';
import 'package:school/Screens/CustomIcons.dart';
import 'package:school/objects/TodoObject.dart';
import 'package:school/pages/Details.dart';





class Homehadj extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homehadj> {
  List<SpecialityModel> specialities;



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle.png"),
                  fit: BoxFit.cover,)
            ),

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(

                    child: FittedBox(
                      child: Center(
                        child: Text(
                          "انواع الحج",
                          style: TextStyle(
                              color: Color(0xffaf5f63),fontFamily: 'AeCortoba',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              fontSize: 300),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/تمتع');
                    },
                    child: Container(
                      //height: size.height * 0.2,
                      // width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Color(0xffddc2be),
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "حج الافراد",
                              style: TextStyle(
                                  color: Color(0xfff1e4d4),fontFamily: 'AeCortoba',
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 40),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/Medium');
                    },
                    child: Container(
                      // height: size.height * 0.2,
                      // width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Color(0xffddc2be),
                      ),
                      padding: EdgeInsets.all(30.0),
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "حج القران",
                              style: TextStyle(
                                  color: Color(0xfff1e4d4),fontFamily: 'AeCortoba',
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 40),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/Hard');
                    },
                    child: Container(
                      //height: size.height * 0.2,
                      //width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Color(0xffddc2be),
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "حج التمتع",
                              style: TextStyle(
                                  color: Color(0xfff1e4d4),fontFamily: 'AeCortoba',
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 40),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );

  }
}