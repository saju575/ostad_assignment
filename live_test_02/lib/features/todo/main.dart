import 'package:flutter/material.dart';
import 'package:live_test_02/features/todo/widgets/main.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTodoField(),
          SizedBox(height: 16),
          ListOfTodo(),
        ],
      ),
    );
  }
}
