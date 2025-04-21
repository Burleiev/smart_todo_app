import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_todo_app/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onLongPress: () async {
              final removedTask = tasks[index];
              final removedIndex = index;
              bool shouldDelete = await showIosStyleAlert(context);
              if (shouldDelete) {
                setState(() {
                  tasks.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Task deleted",
                          style: TextStyle(
                            color: Colors.red.shade900,
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.red[100]),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.red.shade900),
                              side: WidgetStateProperty.all(
                                BorderSide(
                                  color: Colors.red.shade900,
                                  width: 2,
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                tasks.insert(removedIndex, removedTask);
                              });
                            },
                            child: Text("Cancel"))
                      ],
                    ),
                    backgroundColor: Colors.red.shade100,
                  ),
                );
              }
            },
            child: ListTile(
              title: Text(tasks[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DialogScreen(),
            ),
          );
          if (result != null && result is String && result.trim().isNotEmpty) {
            setState(() {
              tasks.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<bool> showIosStyleAlert(BuildContext context) async {
  return await showCupertinoDialog<bool>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('Delete'),
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('Do you really want to delete this task?'),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false); // пользователь отменил
            },
          ),
          CupertinoDialogAction(
            child: Text('OK'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop(true); // подтвердил удаление
            },
          ),
        ],
      );
    },
  ).then((value) => value ?? false); // если null, вернёт false
}
