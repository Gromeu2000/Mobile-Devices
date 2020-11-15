import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(UserListApp());
}

class UserListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User List')),
        body: UserList(),
      ),
    );
  }
}

class User {
  String fullname, username, photoUrl;
  User(this.fullname, this.username, this.photoUrl);
  User.fromJson(Map<String, dynamic> json)
      : fullname = json['name']['first'] + ' ' + json['name']['last'],
        username = json['login']['username'],
        photoUrl = json['picture']['medium'];
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool loading;
  List<User> users;

  void initState() {
    users = [];
    loading = true;

    _loadUsers();

    super.initState();
  }

  void _loadUsers() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get('https://randomuser.me/api/?results=10');
    final json = jsonDecode(response.body);
    List<User> _users = [];
    for (var jsonUser in json['result']) {
      _users.add(User.fromJson(jsonUser));
    }
    setState(() {
      users = _users;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].fullname),
          subtitle: Text(users[index].username),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(users[index].photoUrl),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
