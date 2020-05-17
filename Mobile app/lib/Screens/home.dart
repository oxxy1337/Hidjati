import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/Screens/Hadj.dart';
import 'package:school/Screens/omra.dart';
import 'package:school/Screens/CurvedNavigationBar.dart';
import 'package:school/objects/User.dart';

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
    return MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.green,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.kitchen, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        //body: Container(color: Colors.blueAccent),

        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/acc.png"),
            fit: BoxFit.cover,
          )),
          child: new Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new IconButton(
                    icon: Image.asset('assets/images/omra.png'),
                    iconSize: 100,
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
                    iconSize: 100,
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
