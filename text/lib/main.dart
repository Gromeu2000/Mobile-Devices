import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Center(
      child: SizedBox(
          width: 350,
          height: 100,
          child: Text(
            'un texto' * 5,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            textScaleFactor: 0.7,
            maxLines: 3,
            overflow: TextOverflow.fade,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            decorationColor: Colors.green,
            decorationThickness: 1,
            decorationStyle: TextDecorationStyle.dashed,
            backgroundColor: Colors.purple,
            shadows:[
              Shadow(color: Colors.red, 
              offset: Offset(2,2),
              blurRadius: 2,
              ),
            ],
            letterSpacing: 1,
            wordSpacing: 5,
            height: 2,

          ),
        ),
      ),
    ),
    
    );
  }
}