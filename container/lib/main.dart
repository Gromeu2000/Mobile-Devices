import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Ejemplos Flutter',
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejemplos Flutter'
          ),
      ),
      body: Center(
        child: Container(
         width: 200,
         height: 200,
         decoration: BoxDecoration(
           color: Colors.green,
           border: Border.all(
            color: Colors.brown,
            width: 6,
           ),
           borderRadius: BorderRadius.only(
             topRight: Radius.circular(15),
             bottomLeft: Radius.circular(15),
           ),
           boxShadow: [
             BoxShadow(color: Colors.black45,
             offset: Offset(6, 6),
             blurRadius: 4,
             )
           ]),
         child: Text(
           'Hola',
           style: TextStyle(fontSize: 25),
         ),
        padding: EdgeInsets.only(left: 20),
        constraints: BoxConstraints(
          maxWidth: 100,
          maxHeight: 110,
        )
        ),
      ),
     ),
    );
  }
}