import 'package:flutter/material.dart';
import 'package:todo_app/Home_screen/homescreen.dart';
import 'package:todo_app/Splash_screen/splashscreen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/home': (context) => const Homescreen(),
      },
    );
  }
}
