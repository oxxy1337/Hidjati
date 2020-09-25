import 'package:flutter/material.dart';
import 'package:school/Screens/DropDownFormField.dart';

import 'package:flutter/cupertino.dart';


class Miqaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMiqaat(),
    );
  }
}

class MyMiqaat extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyMiqaat> {
  String _aeroportd;
  String _aeroporta;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _aeroportd = '';
    String _aeroporta;
    String _miqat;
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        if (_aeroporta== "مطار الملك عبد العزيز الدولي "|| _aeroporta== "مطار الطائف الدولي مكة المكرمة")
        { _myActivityResult = 'الجُحْفَة، ويُسمّى رابغ'
        ;}
        else{_myActivityResult = ' أبيار عليّ';

        }

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffaf5f63),
        title: Text('الميقات  للإحرامّ',
          style: TextStyle(fontFamily: 'AeCortoba',
            fontWeight: FontWeight.w300,
            fontSize: 23, ),),
      ),
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Rectangle1.png"),
              fit: BoxFit.cover,)
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(

                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'مطار الانطلاق',
                  hintText: 'الرجاء اختيار مطار',
                  value: _aeroportd,
                  onSaved: (value) {
                    setState(() {
                      _aeroportd = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _aeroportd = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "مطار توات",
                      "value": "مطار توات",
                    },
                    {
                      "display": "مطار هواري بومدين الدولي",
                      "value": "مطار هواري بومدين الدولي",
                    },
                    {
                      "display": "مطار رابح بيطاط",
                      "value": "مطار رابح بيطاط",
                    },
                    {
                      "display": "مطار محمد بوضياف الدولي",
                      "value": "مطار محمد بوضياف الدولي",
                    },
                    {
                      "display": "مطار مفدي زكريا",
                      "value": "مطار مفدي زكريا",
                    },
                    {
                      "display": "مطار كريم بلقاسم",
                      "value": "مطار كريم بلقاسم",
                    },
                    {
                      "display": "مطار وهران الدولي",
                      "value": "مطار وهران الدولي",
                    },
                    {
                      "display": "مطار تمنراست",
                      "value": "مطار تمنراست",
                    },

                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('حفظ', style: TextStyle(fontFamily: 'AeCortoba',
                    fontWeight: FontWeight.w300,
                  )),
                  onPressed: _saveForm,
                  color: const Color(0xffaf5f63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'مطار الوصول',
                  hintText: 'الرجاء اختيار مطار',
                  value: _aeroporta,
                  onSaved: (value) {
                    setState(() {
                      _aeroporta = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _aeroporta = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "مطار الملك عبد العزيز الدولي ",
                      "value": "مطار الملك عبد العزيز الدولي ",
                    },
                    {
                      "display": "مطار الأمير محمد بن عبد العزيز   ",
                      "value": "مطار الأمير محمد بن عبد العزيز  ",
                    },
                    {
                      "display": "  مطار الطائف الدولي مكة المكرمة",
                      "value": "مطار الطائف الدولي مكة المكرمة",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}