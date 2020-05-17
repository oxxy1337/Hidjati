import 'package:flutter/material.dart';

class ColorChoice {
  ColorChoice({@required this.primary, @required this.gradient});

  final Color primary;
  final List<Color> gradient;
}

class ColorChoices {
  static List<ColorChoice> choices = [
    ColorChoice(
      primary: Color(0xFF9d5364),
      gradient: [
        Color.fromRGBO(157, 83, 100, 1.0),
        Color.fromRGBO(168, 89, 110, 1.0),
      ],
    ),

    ColorChoice(
      primary: Color(0xFFAF5F5F),
      gradient: [
        Color.fromRGBO(153, 102, 102, 1.0),
        Color.fromRGBO(158, 83, 80, 1.0),

      ],
    ),
    ColorChoice(
      primary: Color(0xFb76550),
      gradient: [
        Color.fromRGBO(183, 101, 80, 1.0),
        Color.fromRGBO(193, 108, 87, 1.0),

      ],
    ),

  ];
}
