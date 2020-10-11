import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Container(
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}