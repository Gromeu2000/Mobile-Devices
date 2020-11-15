import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
       body: Center(
          child: RaisedButton(
            child: Text('Go back to 1st Screen'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      ),
    );
  }
}
