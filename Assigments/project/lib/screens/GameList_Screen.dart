import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AddGame_Screen.dart';
import 'GameInfo_Screen.dart';

class GameListScreen extends StatefulWidget {
  @override
  _GameListScreenState createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  String order = 'Game';
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

  Widget _buildGameListPage(QuerySnapshot snapshot) {
    final allgames = FirebaseFirestore.instance.collection('Game List 2');
    final docs = snapshot.docs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Game Wishlist'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_rounded),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Filter'),
                  content: Text('Which order do you want to set'),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          order = 'Game';
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Game (Alphabetical)",
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          order = 'Developer';
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Developer (Alphabetical)",
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final batch = FirebaseFirestore.instance.batch();
              for (var item in docs) {
                if (item['Played']) {
                  //Deletes a list item
                  batch.delete(allgames.doc(item.id));
                }
              }
              batch.commit();
            },
          ),
        ],
      ),

      //---------------------------------------------------------------------------------Title Expanded
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                  'List of Games',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),

          //------------------------------------------------------------------------------------List
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.green[50],
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, int index) {
                  final game = docs[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      allgames.doc(game.id);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GameInfoScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            game['Game'],
                            style: TextStyle(
                              fontSize: 17,
                              decoration: game['Played']
                                  //Icon Played
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            game['Grade'].toString(),
                            style: TextStyle(
                              fontSize: 19,
                              decorationThickness: 10,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          game['Fav']
                              ? Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )
                              : Icon(Icons.star, color: Colors.green[50]),
                        ],
                      ),
                      leading: Image.network(game['Icon']),
                      trailing: game['Played']
                          ? Icon(
                              Icons.videogame_asset_rounded,
                              color: Colors.green,
                            )
                          : null,
                      subtitle: Row(
                        children: [
                          Text(game['Developer']),
                          SizedBox(
                            width: 2,
                          ),
                          Text("/"),
                          SizedBox(
                            width: 2,
                          ),
                          Text(game['Platform']),
                          SizedBox(
                            width: 2,
                          ),
                          Text("/"),
                          Text(game['Time Spent'].toString()),
                          SizedBox(
                            width: 2,
                          ),
                          Text('hours')
                        ],
                      ),
                      onTap: () {
                        allgames
                            .doc(game.id)
                            .update({'Played': !game['Played']});
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Delete ${game['Game']}?'),
                            content: Text(
                                'Do you want to delete ${game['Game']} from the list?'),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  allgames.doc(game.id).delete();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          //-------------------------------------------------------------------Down Bar
          Material(
            color: Colors.green[300],
            elevation: 16,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  FlatButton(
                    color: Colors.green[500],
                    hoverColor: Colors.white10,
                    focusColor: Colors.green[700],
                    child: Text(
                      'EXPAND YOUR COLLECTION!',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () =>
                        launch('https://store.steampowered.com/?l=spanish'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: IconButton(
                      hoverColor: Colors.white10,
                      focusColor: Colors.green[700],
                      onPressed: () {
                        //GO TO 2ND SCREEN
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddGame_Screen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.add_box_rounded),
                      iconSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allgames = FirebaseFirestore.instance.collection('Game List 2');
    return StreamBuilder(
      stream: allgames.orderBy(order).snapshots(),
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
