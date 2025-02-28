// import 'package:assignment_02/screens/counter_screen.dart';
import 'package:assignment_02/screens/todo_screen.dart';
// import 'package:assignment_02/screens/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: TodoScreen());
  }
}

// Unused class
// Just for demo perpose

class Person extends Equatable {
  final String name;
  final String number;
  const Person({required this.name, required this.number});

  @override
  List<Object?> get props => [name, number];
}
