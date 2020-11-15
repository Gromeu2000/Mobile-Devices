import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saludo'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Go to 2nd Screen'),
            onPressed: () {
              Navigator.of(context).pushNamed('/two');
            },
          ),
      ),
    );
  }
}
