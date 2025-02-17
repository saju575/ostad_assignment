import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_test_02/features/todo/providers/main.dart';

class ListOfTodo extends ConsumerWidget {
  const ListOfTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(child: Consumer(builder: (context, ref, child) {
      final items = ref.watch(todoProvider.select((state) => state));
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => ListTile(
                horizontalTitleGap: 10,
                title: Text(items[index].title),
              ));
    }));
  }
}
