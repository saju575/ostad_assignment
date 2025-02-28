// event.dart
import 'package:equatable/equatable.dart';

// Abstract Event
abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

// Load Todos Event
class LoadTodos extends TodoEvent {}

// Add Todo Event
class AddTodo extends TodoEvent {
  final String title;
  const AddTodo({required this.title});

  @override
  List<Object> get props => [title];
}

// Toggle Todo Completion Event
class ToggleTodo extends TodoEvent {
  final int id;
  const ToggleTodo({required this.id});

  @override
  List<Object> get props => [id];
}

// Delete Todo Event
class DeleteTodo extends TodoEvent {
  final int id;
  const DeleteTodo({required this.id});

  @override
  List<Object> get props => [id];
}
