import 'package:flutter/material.dart';

// ICON
// class Screen extends StatelessWidget {

//   @override 
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:Scaffold(
//         body: Center(
//           child: Icon(Icons.fullscreen, 
//           size: 80,
//           color: Colors.red 
//           ),
//         ),
//       ),
//     );
//   }
// }

class Screen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
             
              Pastilla('primera', color: Colors.red),
              Pastilla('segunda', color: Colors.blue),
              Pastilla('tercera', color: Colors.green),
              Pastilla('cuarta', color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}

class Pastilla extends StatelessWidget {
  final String texto;
  final Color color;

  const Pastilla(this.texto,{
    Key key,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.symmetric(
       horizontal: 18,
       vertical: 12,
       ),
       margin: EdgeInsets.only(
         bottom:12
         ),
     decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(5, 5),
              blurRadius: 5,
              )
          ],
     ),
     child: Text(
       this.texto,
       style: TextStyle(
         color: Colors.white,
         fontSize: 22,
       ),
      ),
    );
  }
}

void main() {
  runApp(Screen());
}