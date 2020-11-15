import 'package:flutter/material.dart';
import 'package:saludo2/Widgets/FirstScreen.dart';
import 'package:saludo2/Widgets/SecondScreen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/one': (context) => FirstScreen(),
        '/two': (context) => SecondScreen()
      },
      initialRoute: '/one',
    );
  }
}



