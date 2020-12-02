import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'GameList_Screen.dart';

class AddGame_Screen extends StatefulWidget {
  @override
  _AddGame_ScreenState createState() => _AddGame_ScreenState();
}

class _AddGame_ScreenState extends State<AddGame_Screen> {
  TextEditingController _game_controller;
  TextEditingController _developer_controller;
  TextEditingController _icon_controller;

  @override
  void initState() {
    _game_controller = TextEditingController();
    _developer_controller = TextEditingController();
    _icon_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _game_controller.dispose();
   _developer_controller.dispose();
   _icon_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('New Game'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //--------------------------------------TITLE
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.green[200]),
                color: Colors.green[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Add Your Game',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          // ------------------------------------------------GameTitle
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Game Title',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.green[800],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Write your new game title here',
                      ),
                      controller: _game_controller,
                    ),
                  ),
                ),
              ],
            ),
          ),


           // ------------------------------------------------GameDeveloper
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Developer',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.green[800],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Write your new game developer here',
                      ),
                      controller: _developer_controller,
                    ),
                  ),
                ),
              ],
            ),
          ),


            // ------------------------------------------------URL Icon
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Icon',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.green[800],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Paste your game image URL here',
                      ),
                      controller: _icon_controller,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //---------------------------------------------------DOWN BAR
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                onPressed: () {
                  // allgames.add({
                  //   'Game': _controller.text,
                  //   'Played': false,
                  // });
                  // _controller.clear();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GameListScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.save_sharp),
                label: Text("Save your Game"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

