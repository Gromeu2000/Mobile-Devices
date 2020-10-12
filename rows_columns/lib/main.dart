import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Container(
      color: Color.fromARGB(255, 230, 240, 255),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Primera'),
             Container(
              height: 150,
               width: 80,
               color: Colors.green,
               ),
            Text('Segunda'),
            Container(
              height: 50,
               width: 50,
               color: Colors.blue,
               ),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          verticalDirection: VerticalDirection.down,
        ),
      )
    )
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: 40,
    );
    return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Row(
          children: <Widget> [
            Text('uno', style: style),
            Text('dos', style: style.copyWith(
              fontSize: 36,
            )),
            Text('tres', style: style.copyWith(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            )),
          ],
          //Same as column
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
        ),
      )
    )
    );
  }
}