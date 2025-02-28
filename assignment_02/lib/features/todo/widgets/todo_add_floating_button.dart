import 'package:assignment_02/features/todo/bloc/todo_bloc_bloc.dart';
import 'package:assignment_02/features/todo/bloc/todo_bloc_event.dart';
// import 'package:assignment_02/features/todo/bloc/todo_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoAddFloatingActionButton extends StatelessWidget {
  const TodoAddFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    final TextEditingController controller = TextEditingController();

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add Todo"),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      todoBloc.add(AddTodo(title: controller.text));
                      controller.clear();

                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
