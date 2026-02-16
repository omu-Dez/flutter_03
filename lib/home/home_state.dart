import 'package:flutter_application_1/todo.dart';

class HomeState {
  final List <Todo> items;
  final bool isEmpty;
  const HomeState ({required this.isEmpty, required this.items});
  factory HomeState.initial() => const HomeState(isEmpty: true, items: []);
  
  HomeState copyWith({
    List<Todo>? items,
    bool? isEmpty,
  }){
    return HomeState(isEmpty: isEmpty ?? this.isEmpty, items: items ?? this.items);
  }
}