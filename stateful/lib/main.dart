import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SinEstado(),
          ConEstado(),
        ],
      ),
    );
  }
}


class SinEstado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text("Sin Estado"),
      ),
    );
  }
}


class ConEstado extends StatefulWidget {
  @override
  _ConEstadoState createState() => _ConEstadoState();
}

class _ConEstadoState extends State<ConEstado> {

  bool activo;

  @override
  void initState() {
    super.initState();
    activo = false;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            activo = !activo;
          }
        ); 
       },
      child: Container(
        height: 200,
        color: (activo ? Colors.blue : Colors.grey),
        child: Center(
          child: Text('Con Estado'),
          ),
      ),
    );
  }
}