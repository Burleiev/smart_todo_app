import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item: $index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Добавить задачу");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
