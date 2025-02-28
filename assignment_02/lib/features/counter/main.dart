// import 'package:assignment_02/features/counter/bloc/counter_bloc.dart';
// import 'package:assignment_02/features/counter/bloc/counter_event.dart';
// import 'package:assignment_02/features/counter/bloc/counter_state.dart';
import 'package:assignment_02/features/counter/cubit/counter_cubit_cubit.dart';
import 'package:assignment_02/features/counter/cubit/counter_cubit_state.dart';
import 'package:assignment_02/styles/app_text_style.dart';
import 'package:assignment_02/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterFeature extends StatelessWidget {
  const CounterFeature({super.key});

  @override
  Widget build(BuildContext context) {
    print("run counter feature");
    final counterBloc = context.read<CounterCubitCubit>();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: BlocBuilder<CounterCubitCubit, CounterCubitState>(
              builder: (context, state) {
            return Text(
              "Counter ${state.counter}",
              style: AppTextStyles.regular
                  .copyWith(color: AppColors.textPrimaryColor, fontSize: 18),
            );
          })),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    counterBloc.decrementCounter();
                  },
                  icon: const Icon(Icons.remove)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    counterBloc.incrementCounter();
                  },
                  icon: const Icon(Icons.add)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    counterBloc.incrementByValue(5);
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ]);
  }
}
