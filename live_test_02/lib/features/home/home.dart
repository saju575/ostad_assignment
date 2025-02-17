import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_test_02/features/home/search_field.dart';
import 'package:live_test_02/providers/counter_provider.dart';
import 'package:live_test_02/providers/search_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build 2");

    return Column(
      children: [
        const Text("Home"),
        const SizedBox(
          height: 20,
        ),
        const SearchField(),
        const SizedBox(height: 16),
        Consumer(builder: (context, ref, child) {
          print("Search query value build");
          final searchQueryValue =
              ref.watch(searchProvider.select((state) => state.query));
          return Text(searchQueryValue);
        }),
        Consumer(builder: (context, ref, child) {
          final counter = ref.watch(counterProvider);
          return Center(child: Text(counter.toString()));
        }),
      ],
    );
  }
}
