import 'package:assignment_02/features/todo/bloc/todo_bloc_event.dart';
import 'package:assignment_02/features/todo/bloc/todo_bloc_state.dart';
import 'package:bloc/bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<ToggleTodo>(_onToggleTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  final List<Todo> _todos = [];

  void _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    // Simulate a delay for fetching todos (e.g., from an API)
    await Future.delayed(const Duration(seconds: 1))
        .whenComplete(() => emit(TodoLoaded(todos: _todos)));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    if (state is TodoLoaded) {
      final List<Todo> updatedTodos = List.from((state as TodoLoaded).todos)
        ..add(Todo(
            id: DateTime.now().millisecondsSinceEpoch, title: event.title));
      emit((state as TodoLoaded).copyWith(todos: updatedTodos));
    }
  }

  void _onToggleTodo(ToggleTodo event, Emitter<TodoState> emit) {
    if (state is TodoLoaded) {
      final List<Todo> updatedTodos = (state as TodoLoaded)
          .todos
          .map((todo) => todo.id == event.id
              ? todo.copyWith(isCompleted: !todo.isCompleted)
              : todo)
          .toList();

      emit((state as TodoLoaded).copyWith(todos: updatedTodos));
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    if (state is TodoLoaded) {
      final List<Todo> updatedTodos = List.from((state as TodoLoaded).todos)
        ..removeWhere((todo) => todo.id == event.id);
      emit((state as TodoLoaded).copyWith(todos: updatedTodos));
    }
  }
}
