// main.dart
import 'package:assignment_02/features/todo/bloc/todo_bloc_bloc.dart';
import 'package:assignment_02/features/todo/bloc/todo_bloc_event.dart';
import 'package:assignment_02/features/todo/main.dart';
import 'package:assignment_02/features/todo/widgets/todo_add_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodoBloc()..add(LoadTodos()))
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text("Todo List")),
          body: const TodoFeature(),
          floatingActionButton: const TodoAddFloatingActionButton(),
        ));
  }
}
