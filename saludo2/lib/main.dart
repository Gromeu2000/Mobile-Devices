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

class SaludoScreen extends StatefulWidget {
  @override
  _SaludoScreenState createState() => _SaludoScreenState();
}

class _SaludoScreenState extends State<SaludoScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saludo2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre',
                suffix: GestureDetector(
                  child: Icon(
                    Icons.backspace,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    _controller.clear();
                  },
                ),
              ),
              onSubmitted: (String textoFinal) {
                if (textoFinal.isNotEmpty) {
                  _saluda(context, textoFinal);
                }
              },
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              
              child: RaisedButton(
                child: Text('Saludar'),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _saluda(context, _controller.text);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _saluda(BuildContext context, String textoFinal) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Saludos'),
        content: Text('Hola, $textoFinal, como estas?'),
      ),
    );
  }
}
