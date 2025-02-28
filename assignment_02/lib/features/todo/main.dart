import 'package:assignment_02/features/todo/bloc/todo_bloc_bloc.dart';
import 'package:assignment_02/features/todo/bloc/todo_bloc_event.dart';
import 'package:assignment_02/features/todo/bloc/todo_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoFeature extends StatefulWidget {
  const TodoFeature({super.key});

  @override
  State<TodoFeature> createState() => _TodoFeatureState();
}

class _TodoFeatureState extends State<TodoFeature> {
  late final todoBloc = context.read<TodoBloc>();

  void handleDeleteTodo(int id) {
    todoBloc.add(DeleteTodo(id: id));
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoLoaded) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return TodoCard(
                title: todo.title,
                isCompleted: todo.isCompleted,
                onToggleTodo: (value) => todoBloc.add(ToggleTodo(id: todo.id)),
                onDeleteTodo: () => handleDeleteTodo(todo.id),
              );
            },
          );
        } else if (state is TodoError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text("No Todos Yet"));
      },
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard(
      {super.key,
      required this.title,
      required this.isCompleted,
      this.onToggleTodo,
      this.onDeleteTodo});
  final String title;
  final bool isCompleted;
  final Function(bool?)? onToggleTodo;
  final VoidCallback? onDeleteTodo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: isCompleted,
        onChanged: onToggleTodo,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDeleteTodo,
      ),
    );
  }
}
