import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_test_02/providers/search_provider.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Full Serch field");
    final search = ref.read(searchProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        TextField(
          onChanged: (value) => search.setSearch(query: value),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
        ),
        const SizedBox(height: 16),
        Consumer(builder: (context, ref, child) {
          print("Is featured build");
          final value =
              ref.watch(searchProvider.select((state) => state.isFeature));
          final onChanged = ref.read(searchProvider.notifier).toggleFeature;
          return Switch(value: value, onChanged: onChanged);
        })
      ]),
    );
  }
}
