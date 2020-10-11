
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Ejemplos Flutter',
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: Scaffold(
      appBar: AppBar(
        title: Icon(Icons.alarm),
      ),
      body: Center(
        child: Text('Hola, Flutter App'),
        ),
      ),
    );
  }
}

void main(){
 
runApp(Screen1());
  // runApp(Directionality(
  //   textDirection: TextDirection.ltr,
  //   child: Center(
  //     child: Text(
  //       'Hola, Flutter', 
  //       style: TextStyle(
  //         fontSize: 30
  //         ),
  //       ),
  //     ),
  // ));
}