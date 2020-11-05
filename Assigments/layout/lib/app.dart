import 'package:flutter/material.dart';

import 'screens/animal_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Assigment',
      home: AnimalScreen(),
    );
  }
}
