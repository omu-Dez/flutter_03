import 'package:flutter_application_1/database/appDatabase.dart';
import 'package:flutter_application_1/database/todoRepository.dart';
import 'package:flutter_application_1/home/homeState.dart';
import 'package:flutter_application_1/todo.dart' hide Todo;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel {
  final TodoRepository repo;

  HomeViewModel({required this.repo});

  Future<List<Todo>> fetchList() => repo.getList();

  String _currentFormattedDate() {
    final now = DateTime.now();
    return "${now.day}.${now.month}.${now.year} "
        "${now.hour.toString().padLeft(2, '0')}:"
        "${now.minute.toString().padLeft(2, '0')}";
  }

  Future<void> saveTodo(String title, String description) async {
    final todo = TodosCompanion.insert(
      title: title,
      description: description,
      date: _currentFormattedDate(),
    );

    await repo.addTodo(todo);
  }

  Future<void> updateTodo(int id, String title, String description) async {
    final updated = Todo(
      id: id,
      title: title,
      description: description,
      date: _currentFormattedDate(),
      isDone: false,
    );

    await repo.updateTodo(updated);
  }

  Future<void> deleteTodo(int id) async {
    await repo.deleteTodo(id);
  }
}

class HomeCubit extends Cubit<HomeState> {
  final HomeViewModel vm;

  HomeCubit({required this.vm}) : super(HomeState.initial());

  Future<void> fetchList() async {
    try {
      final items = await vm.fetchList();

      emit(
        state.copyWith(
          items: items,
          isEmpty: items.isEmpty,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> save({
    required String title,
    required String description,
  }) async {
    await vm.saveTodo(title, description);
    await fetchList();
  }

  Future<void> update({
    required int id,
    required String title,
    required String description,
  }) async {
    await vm.updateTodo(id, title, description);
    await fetchList();
  }

  Future<void> delete(int id) async {
    await vm.deleteTodo(id);
    await fetchList();
  }
}