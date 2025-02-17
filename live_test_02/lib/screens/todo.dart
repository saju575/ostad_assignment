import 'package:flutter/material.dart';
import 'package:live_test_02/features/todo/main.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
          centerTitle: true,
        ),
        body: const Todo());
  }
}
