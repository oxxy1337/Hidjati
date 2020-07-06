import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:school/Screens/DataQiraan.dart';
import 'package:school/objects/TodoObject.dart';
import 'package:school/pages/Details.dart';


class Hadj_Qiraan extends StatefulWidget {


  @override
  _HadjQiraan createState() => new _HadjQiraan();
}

class _HadjQiraan extends State<Hadj_Qiraan> with TickerProviderStateMixin {
  ScrollController scrollController;
  Color backgroundColor;
  LinearGradient backgroundGradient;
  Tween<Color> colorTween;
  int currentPage = 0;
  Color constBackColor;


  @override
  void initState() {
    super.initState();
    colorTween = ColorTween(begin: todos[0].color, end: todos[0].color);
    backgroundColor = todos[0].color;
    backgroundGradient = todos[0].gradient;
    scrollController = ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
//      ScrollDirection direction = position.userScrollDirection;
      int page = position.pixels ~/ (position.maxScrollExtent / (todos.length.toDouble() - 1));
      double pageDo = (position.pixels / (position.maxScrollExtent / (todos.length.toDouble() - 1)));
      double percent = pageDo - page;
      if (todos.length - 1 < page + 1) {
        return;
      }
      colorTween.begin = todos[page].color;
      colorTween.end = todos[page + 1].color;
      setState(() {
        backgroundColor = colorTween.transform(percent);
        backgroundGradient = todos[page].gradient.lerpTo(todos[page + 1].gradient, percent);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("عمرة"),
          centerTitle: true,

          actions: <Widget>[

          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(5.0, 5.0), blurRadius: 15.0)],
                  shape: BoxShape.circle,
                ),

              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                "نتمنى لك عمرة مباركة",
                style: TextStyle(color: Colors.white, fontSize: 20.0,fontFamily: 'AeCortoba'),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                "نتمنى لك عمرة مباركة",
                style: TextStyle(color: Colors.white70,fontFamily: 'AeCortoba'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                "لا تنسى الالتزام و قراءة الاحاديث",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 50.0,
              ),
              child: RichText(
                text: TextSpan(
                  children: [

                    TextSpan(
                      text: DateFormat.yMMMMd().format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: " :  اليوم ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 20,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  TodoObject todoObject = todos[index];
                  double percentComplete = todoObject.percentComplete();

                  return Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0),

                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => DetailPage(todoObject: todoObject),
                            transitionDuration: Duration(milliseconds: 1000),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [BoxShadow(color: Colors.black.withAlpha(70),
                                offset: Offset(3.0, 10.0),
                                blurRadius: 15.0)
                            ]),
                        height: 250.0,
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: todoObject.uuid + "_background",
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),

                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 10,
                                    child: Row(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[

                                            Hero(
                                              tag: todoObject.uuid + "_backIcon",
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff5ebec),
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    //   image: DecorationImage(
                                                    //    image: AssetImage("assets/images/be.png"),
                                                    //    fit: BoxFit.cover,
                                                    //   )
                                                  ),
                                                  height: 0,
                                                  width: 0,
                                                  child: IconButton(
                                                    icon: Icon(Icons.arrow_back),
                                                    onPressed: null,
                                                  ),
                                                ),
                                              ),
                                            ),































                                          ],
                                        ),
                                        Spacer(),

                                      ],
                                    ),
                                  ),
                                  Hero(
                                    tag: todoObject.uuid + "_number_of_tasks",
                                    child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          todoObject.taskAmount().toString() + " توجيهات",
                                          style: TextStyle(),
                                          softWrap: false,
                                        )),
                                  ),
                                  Spacer(),
                                  Hero(
                                    tag: todoObject.uuid + "_title",
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        todoObject.title,
                                        style: TextStyle(fontSize: 25.0,
                                          fontFamily: 'AeCortoba',

                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Hero(
                                    tag: todoObject.uuid + "_progress_bar",
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              value: percentComplete,
                                              backgroundColor: Colors.grey.withAlpha(50),
                                              valueColor: AlwaysStoppedAnimation<Color>(todoObject.color),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.0),
                                            child: Text((percentComplete * 100).round().toString() + "%"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                scrollDirection: Axis.horizontal,
                physics: _CustomScrollPhysics(),
                controller: scrollController,
                itemExtent: _width - 80,
                itemCount: todos.length,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomScrollPhysics extends ScrollPhysics {
  _CustomScrollPhysics({
    ScrollPhysics parent,
  }) : super(parent: parent);

  @override
  _CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / (position.maxScrollExtent / (todos.length.toDouble() - 1));
    // return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollPosition position, double page) {
    // return page * position.viewportDimension;
    return page * (position.maxScrollExtent / (todos.length.toDouble() - 1));
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity) page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) || (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }
}
