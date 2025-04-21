// dialog.dart
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Enter task",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final task = _controller.text.trim();
                if (task.isNotEmpty) {
                  Navigator.pop(context, task);
                  _controller.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "The task was saved successfully",
                        style: TextStyle(
                          color: Colors.green.shade900,
                        ),
                      ),
                      backgroundColor: Colors.green[100],
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text("Add Task"),
            )
          ],
        ),
      ),
    );
  }
}
