import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_test_02/features/todo/models/main.dart';

final todoProvider = StateNotifierProvider<ItemNotifier, List<Item>>(
  (ref) => ItemNotifier(),
);

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem({required String title}) {
    final item = Item(title: title, id: DateTime.now().toString(), done: false);
    state = [...state, item];
  }
}
