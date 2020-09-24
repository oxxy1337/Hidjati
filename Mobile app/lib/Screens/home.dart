import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/Screens/Hadj.dart';
import 'package:school/Screens/Miqaat.dart';
import 'package:school/Screens/agence.dart';
import 'package:school/Screens/omra.dart';
import 'package:school/Screens/CurvedNavigationBar.dart';
import 'package:school/objects/User.dart';
import 'package:school/pages/quran_page.dart';
import 'package:school/Screens/Places.dart';

class Home extends StatefulWidget {
   User user;

  Home(this.user);

  @override
  Home_main createState() => new Home_main(user);
}

class Home_main extends State<Home> {
  User user;

  Home_main(this.user);

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
            Icon(Icons.local_library, size: 30),
            Icon(Icons.map, size: 30),
            Icon(Icons.airplanemode_active, size: 30),
            Icon(Icons.store_mall_directory, size: 30),

          ],
          onTap: (index) {
            if (index==1){  Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new QuranPage();
                },
              ),

            );}
            if (index==2){  Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return  Places();
                },
              ),

            );
            }

            if (index==3){  Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return  Miqaat();
                },
              ),

            );
            }
            if (index==4){  Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return  Agence();
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
