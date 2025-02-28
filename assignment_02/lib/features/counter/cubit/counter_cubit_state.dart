import 'package:equatable/equatable.dart';

class CounterCubitState extends Equatable {
  final int counter;
  const CounterCubitState({required this.counter});

  CounterCubitState copyWith({int? counter}) {
    return CounterCubitState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}
