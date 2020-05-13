import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:io';

//test the connection between app<=>api

class Test {
  static void printresults() async {
    http.get("http://9d9d2110.ngrok.io").then((data) {
      print(json.decode(data.body));
    });
  }
}
