import 'package:flutter/material.dart';
import 'package:smart_todo_app/dialog.dart';
import 'package:smart_todo_app/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/dialog': (context) => DialogScreen(),
      },
    );
  }
}



