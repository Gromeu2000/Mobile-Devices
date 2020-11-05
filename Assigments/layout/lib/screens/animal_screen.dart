import 'package:flutter/material.dart';

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Dev22.png'),
                  scale: 1,
                fit: BoxFit.none,
                ),
                color: Color.fromRGBO(192, 204, 207, 1),
              ),

             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget> [
                 Container(
                   padding: EdgeInsets.only(top: 30, left: 15),
                    child: Icon(
                     Icons.keyboard_backspace_outlined,
                     color: Colors.grey[600], 
                     size: 35
                     )
                 ),

                  Container(
                     child: Icon(
                     Icons.logout,
                     color: Colors.grey[600],
                     size: 25,
                    ),
                 ),
          
                Container(
                    padding: EdgeInsets.only(top: 30, right: 15),
                     child: Icon(
                     Icons.logout,
                     color: Colors.grey[600],
                     size: 25,
                    ),
                 ),
               ],
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
             ),
            ),

            Expanded(
               child: Container(
                height: 100,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
