class Item {
  final String id;
  final String title;
  final bool? done;

  Item({required this.id, required this.title, this.done = false});

  Item copyWith({String? id, String? title, bool? done}) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }
}
