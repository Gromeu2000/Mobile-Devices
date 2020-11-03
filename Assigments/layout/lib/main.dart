import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 325,
              child: Image.asset('assets/Devices.jpg'),
            ),
            Expanded(
               child: Container(
                height: 100,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

  }
}


