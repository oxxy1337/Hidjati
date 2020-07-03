import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:school/Screens/Hadj_Ifrad.dart';
import 'package:school/Screens/Hadj_Qiraan.dart';
import 'package:school/Screens/Hadj_Tamatoaa.dart';
import 'package:school/slime/slimy_card.dart';

class Hadj extends StatefulWidget {
  @override
  _HadjPage createState() => _HadjPage();
}

class _HadjPage extends State<Hadj> {
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


              SlimyCard(

                topCardWidget: thirdtopCardWidget((snapshot.data)
                    ? ''
                    : ''),
                bottomCardWidget: thirdCardWidget(),
              ),
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
                  return new Hadj_Ifrad();
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('حج الافراد',style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30),

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
                  return new Hadj_Tamtoaa();
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('حج التمتع',style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30)

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
        FlatButton(
          onPressed: (){
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Hadj_Qiraan();
                },
              ),
            );
          },
          textColor: Color(0xff2d3142),
          child: Text('حج القران',
              style: TextStyle(fontFamily: 'AeCortoba',fontSize: 30)
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
      '  نية الحج وحده,ثم الاعتمار بعد الفراغ من المناسك',
      style: TextStyle(
       fontFamily: 'AeCortoba',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget secondCardWidget() {
    return Text(
      'نية العمرة وحدها ثم الحج',
      style: TextStyle(
        fontFamily: 'AeCortoba',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget thirdCardWidget() {
    return Text(
      'نية الحج و العمرة معا بعد التروية',
      style: TextStyle(
        fontFamily: 'AeCortoba',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}


