import 'package:flutter/material.dart';

class succes extends StatelessWidget {
  final String body;

  succes(@required this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user'),
      ),
      body: Container(
        child: Text(body),
      ),
    );
  }
}
