// import 'package:assignment_02/features/counter/bloc/counter_bloc.dart';
import 'package:assignment_02/features/counter/cubit/counter_cubit_cubit.dart';
import 'package:assignment_02/features/counter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => CounterBloc(),
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Counter"),
  //       ),
  //       body: const CounterFeature(),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubitCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter"),
        ),
        body: const CounterFeature(),
      ),
    );
  }
}
