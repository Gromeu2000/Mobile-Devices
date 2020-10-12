import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
        child: Container(
          width: 320,
          height: 320,
          color: Colors.deepOrange,
          child: Image.asset('assets/Samira_BaseSplash_FINAL_optimized.jpg'),
          ),
        ),
      ),
    );
  }
}