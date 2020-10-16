import 'package:flutter/material.dart';

void main() {
  runApp(Screen());
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          // widthFactor: 2.0,
          // heightFactor: 3.0,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          )
        )
      )
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget> [
            Container(
              color: Colors.red,
              height: 100,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                height: 100,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
                height: 100,
              ),
            ),
          ],
        )
      )
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.grey,
            child: Align(
              alignment: Alignment.bottomCenter,
              
              child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
              )
            )
          ),
        )
      ),
    );
  }
}