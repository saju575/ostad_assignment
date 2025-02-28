// state.dart
import 'package:equatable/equatable.dart';

// Abstract State
abstract class TodoState extends Equatable {
  const TodoState();
  @override
  List<Object> get props => [];
}

// Initial State
class TodoInitial extends TodoState {}

// Loading State
class TodoLoading extends TodoState {}

// Loaded State
class TodoLoaded extends TodoState {
  final List<Todo> todos;
  const TodoLoaded({required this.todos});

  TodoLoaded copyWith({List<Todo>? todos}) {
    return TodoLoaded(todos: todos ?? this.todos);
  }

  @override
  List<Object> get props => [todos];
}

// Error State
class TodoError extends TodoState {
  final String message;
  const TodoError({required this.message});

  @override
  List<Object> get props => [message];
}

// Todo Model
class Todo extends Equatable {
  final int id;
  final String title;
  final bool isCompleted;

  const Todo({required this.id, required this.title, this.isCompleted = false});

  Todo copyWith({int? id, String? title, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object> get props => [id, title, isCompleted];
}
