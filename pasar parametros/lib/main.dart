import 'package:flutter/material.dart';

void main() => runApp(TextEditApp());

class TextEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => ColorScreen(),
      '/edit': (context) => EditColorScreen(),
    });
  }
}

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _color = Color.fromARGB(255, 255, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            child: Text('Cambiar Color'),
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/edit',
                arguments: _color, // 1. Enviar argumentos
              ).then((result) {

                if (result != null) {

                  setState(() {
                    _color = result;
                  });
                }

               });
            },
          ),
        ),
      ),
    );
  }
}

class EditColorScreen extends StatefulWidget {
  @override
  _EditColorScreenState createState() => _EditColorScreenState();
}

class _EditColorScreenState extends State<EditColorScreen> {
  List<TextEditingController> _controllers;

@override
  void didChangeDependencies() {
     // 2. Recibir argumentos
    final Color color = ModalRoute.of(context).settings.arguments;
    final List<String> canales = [
      color.red.toString(),
      color.green.toString(),
      color.blue.toString(),
    ];
     _controllers = [
       for (int i = 0; i < 3; i++) TextEditingController(
         text: canales[i]
         ),
       ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   
    const List<String> colores = ['red', 'green', 'blue'];

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Color'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                            controller: _controllers[i],
                            decoration: InputDecoration(
                              labelText: colores[i],
                            )),
                      ),
                    ),
                ],
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  final int r = int.parse(_controllers[0].text);
                  final int g = int.parse(_controllers[1].text);
                  final int b = int.parse(_controllers[2].text);
                  Navigator.of(context).pop(Color.fromARGB(255, r, g, b));
                },
              ),
            ],
          ),
        ));
  }
}
