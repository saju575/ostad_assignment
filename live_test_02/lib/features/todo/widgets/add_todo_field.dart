import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_test_02/features/todo/providers/main.dart';

class AddTodoField extends ConsumerStatefulWidget {
  const AddTodoField({super.key});

  @override
  ConsumerState<AddTodoField> createState() => _AddTodoFieldState();
}

class _AddTodoFieldState extends ConsumerState<AddTodoField> {
  final TextEditingController _addTodoFieldcontroller = TextEditingController();

  void _addNewTodo() {
    final todo = _addTodoFieldcontroller.text;
    ref.read(todoProvider.notifier).addItem(title: todo);
    _addTodoFieldcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _addTodoFieldcontroller,
      decoration: InputDecoration(
        suffixIcon:
            IconButton(onPressed: _addNewTodo, icon: const Icon(Icons.add)),
        border: const OutlineInputBorder(),
        hintText: 'Add new Todo',
      ),
    );
  }
}
