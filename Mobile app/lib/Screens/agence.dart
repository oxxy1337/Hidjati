import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:school/slime/slimy_card.dart';

class Agence extends StatefulWidget {
  @override
  _AgencePage createState() => _AgencePage();
}

class _AgencePage extends State<Agence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,)
        ),


        child: StreamBuilder(
          initialData: false,
          stream: slimyCard.stream, //Stream of SlimyCard
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(height: 100),

                // SlimyCard is being called here.
                SlimyCard(
                  // In topCardWidget below, imagePath changes according to the
                  // status of the SlimyCard(snapshot.data).
                  topCardWidget: firsttopCardWidget((snapshot.data)
                      ? ''
                      : ''),
                  bottomCardWidget: firstCardWidget(),
                ),
                SizedBox(height: 100),

                // SlimyCard is being called here.
                SlimyCard(
                  // In topCardWidget below, imagePath changes according to the
                  // status of the SlimyCard(snapshot.data).
                  topCardWidget: secondtopCardWidget((snapshot.data)
                      ? ''
                      : ''),
                  bottomCardWidget: secondCardWidget(),
                ),
                SizedBox(height: 100),



              ],
            );
          }),
        ),
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget firsttopCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 70,

        ),
        SizedBox(height: 1),
        FlatButton(
          onPressed: (){
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return ;
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('وكالة شهرة ',style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30),

          ),

        ),
        SizedBox(height: 15),

        SizedBox(height: 10),
      ],
    );
  }

  Widget secondtopCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 70,

        ),
        SizedBox(height: 1),
        FlatButton(
          onPressed: (){
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return ;
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('وكالة زمزم',style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30)

          ),

        ),
        SizedBox(height: 15),

        SizedBox(height: 10),
      ],
    );
  }
  Widget thirdtopCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 70,

        ),
        SizedBox(height: 1),

        SizedBox(height: 15),

        SizedBox(height: 10),
      ],
    );
  }
  Widget fourthtopCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 70,

        ),
        SizedBox(height: 1),
        FlatButton(
          onPressed: (){
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return ;
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('وكالة اسفار',style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30)

          ),

        ),
        SizedBox(height: 15),

        SizedBox(height: 10),
      ],
    );
  }
  Widget fivetopCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 70,

        ),
        SizedBox(height: 1),
        FlatButton(
          onPressed: (){
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return ;
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('وكالة الوجدان',style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30)

          ),

        ),
        SizedBox(height: 15),

        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget firstCardWidget() {
    return Text(
      '  Tél : +213 (0) 48 51 79 98. Fax : +213 (0) 48 51 68 44',
      style: TextStyle(
        fontFamily: 'AeCortoba',
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget secondCardWidget() {
    return Text(
      ' Tél : +213 (0) 48 51 79 98. Fax : +213 (0) 48 51 68 44',
      style: TextStyle(
        fontFamily: 'AeCortoba',
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget fourthCardWidget() {
    return Text(
      '  Tél : +213 (0) 48 51 79 98. Fax : +213 (0) 48 51 68 44',
      style: TextStyle(
        fontFamily: 'AeCortoba',
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget fiveCardWidget() {
    return Text(
      '  Tél : +213 (0) 48 51 79 98. Fax : +213 (0) 48 51 64 44',
      style: TextStyle(
        fontFamily: 'AeCortoba',
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

}


