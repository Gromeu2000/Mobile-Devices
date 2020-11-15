import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SaludoScreen(),
    );
  }
}

class SaludoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saludo2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            labelText: 'Nombre',
          ),
          onSubmitted: (String textoFinal) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Saludos'),
                content: Text('Hola, $textoFinal, como estas?'),
              ),
            );
          },
        ),
      ),
    );
  }
}
