import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'GameList_Screen.dart';


class GameInfoScreen extends StatefulWidget {
  @override
  _GameInfoScreenState createState() => _GameInfoScreenState();
}

class _GameInfoScreenState extends State<GameInfoScreen> {
  
  bool _isEditingText = false;
  TextEditingController _game_controller;
  String initialText = "Initial Text";

   Widget _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
          ),
          child: TextField(
            textAlign: TextAlign.center,
            cursorColor: Colors.green[800],
            onSubmitted: (newValue) {
              setState(() {
                initialText = newValue;
                _isEditingText = false;
              });
            },
            autofocus: true,
            controller: _game_controller,
          ),
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        initialText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildErrorPage(String message) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildLoadingPage() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    _game_controller = TextEditingController(text: initialText);
    super.initState();
  }

  @override
  void dispose() {
    _game_controller.dispose();
    super.dispose();
  }

  Widget _buildGameListPage(QuerySnapshot snapshot) {
   final db = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Game Info'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            iconSize: 30,
            disabledColor: Colors.amber,
            onPressed: () {

            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
                'Edit Your Game',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          // ------------------------------------------------GameTitle
          Column(
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
                padding: const EdgeInsets.only(left: 25),
                child: _editTitleTextField(),
              ),

              //---------------------------------------------------DOWN BAR
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GameListScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.save_sharp),
                  label: Text("Apply Changes"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allgames = FirebaseFirestore.instance.collection('Game List 2');
    return StreamBuilder(
      stream: allgames.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorPage(snapshot.error.toString());
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoadingPage();
          case ConnectionState.active:
            return _buildGameListPage(snapshot.data);
          default: // ConnectionState.none // ConnectionState.done
            return _buildErrorPage("Ups! Something went wrong");
        }
      },
    );
  }
}
