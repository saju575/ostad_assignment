import 'package:assignment_02/features/counter/cubit/counter_cubit_state.dart';
import 'package:bloc/bloc.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(const CounterCubitState(counter: 0));

  void incrementCounter() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrementCounter() {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void incrementByValue(int value) {
    emit(state.copyWith(counter: state.counter + value));
  }
}
