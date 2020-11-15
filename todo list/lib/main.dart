import 'package:flutter/material.dart';

void main() {
  runApp(UserListApp());
}

class Todo {
  String what;
  bool done;
  Todo(this.what) : done = false;

  void toggleDone() => done = !done;
}

class UserListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({
    Key key,
  }) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> _todos;

  int get checkedCount => _todos.where((todo) => todo.done).length;

  @override
  void initState() {
    _todos = [
      Todo('Primero'),
      Todo('Segundo'),
      Todo('Tercero'),
    ];
    super.initState();
  }

  _removeChecked() {
    List<Todo> pending = [];
    for (var todo in _todos) {
      if (!todo.done) pending.add(todo);
    }
    setState(() {
      _todos = pending;
    });
  }

  @override
  Widget build(BuildContext context) {
    _maybeRemoveChecked() {
      if (checkedCount == 0) {
        return;
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure about that?'),
          actions: [
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        ),
      ).then((remove) {
        if (remove) {
          _removeChecked();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _maybeRemoveChecked,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _todos[index].toggleDone();
            });
          },
          child: ListTile(
            leading: Checkbox(
                value: _todos[index].done,
                onChanged: (checked) {
                  setState(() {
                    _todos[index].done = checked;
                  });
                }),
            title: Text(
              _todos[index].what,
              style: TextStyle(
                decoration: (_todos[index].done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
            builder: (_) => NewTodoPage(),
          ))
              .then((what) {
            setState(() {
              _todos.add(Todo(what));
            });
          });
        },
      ),
    );
  }
}

class NewTodoPage extends StatefulWidget {
  @override
  _NewTodoPageState createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Todo...'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                onSubmitted: (what) {
                  Navigator.of(context).pop(what);
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  Navigator.of(context).pop(_controller.text);
                },
              )
            ],
          ),
        ));
  }
}
