import 'package:flutter_application_1/database/appDatabase.dart';

class HomeState {
  final List<Todo> items;
  final bool isEmpty;
  final String? error;

  const HomeState({
    required this.items,
    required this.isEmpty,
    required this.error,
  });

  factory HomeState.initial() =>
      const HomeState(items: [], isEmpty: true, error: null);

  HomeState copyWith({
    List<Todo>? items,
    bool? isEmpty,
    String? error,
  }) {
    return HomeState(
      items: items ?? this.items,
      isEmpty: isEmpty ?? this.isEmpty,
      error: error ?? this.error,
    );
  }
}