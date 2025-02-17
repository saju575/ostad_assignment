import 'package:flutter_riverpod/flutter_riverpod.dart';

class Search {
  final String query;
  final bool isFeature;
  Search({required this.query, required this.isFeature});

  Search copyWith({String? query, bool? isFeature}) {
    return Search(
        query: query ?? this.query, isFeature: isFeature ?? this.isFeature);
  }
}

class SearchNotifier extends StateNotifier<Search> {
  SearchNotifier() : super(Search(query: "", isFeature: false));

  void setSearchQuery(String query) {
    state = state.copyWith(query: query);
  }

  void toggleFeature(bool isFeature) {
    state = state.copyWith(isFeature: isFeature);
  }

  void reset() {
    state = Search(query: "", isFeature: false);
  }

  void setSearch({String? query, bool? isFeature}) {
    state = state.copyWith(query: query, isFeature: isFeature);
  }
}

final searchProvider =
    StateNotifierProvider<SearchNotifier, Search>((ref) => SearchNotifier());
