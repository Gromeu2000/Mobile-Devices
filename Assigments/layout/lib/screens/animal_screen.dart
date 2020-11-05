import 'package:flutter/material.dart';

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Dev22.png'),
                  scale: 1,
                fit: BoxFit.none,
                ),
                color: Color.fromRGBO(192, 204, 207, 1),
              ),
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
