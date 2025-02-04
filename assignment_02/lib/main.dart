import 'package:assignment_02/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class MyNew extends StatelessWidget {
  const MyNew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}
