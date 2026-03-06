import 'package:flutter_application_1/database/appDatabase.dart';
import 'package:flutter_application_1/database/todos.dart';

abstract class TodoRepository {
  Future<List<Todo>> getList();
  Future<void> addTodo(TodosCompanion todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(int id);
}

class TodorepositoryImpl implements TodoRepository {
  final AppDatabase db;

  TodorepositoryImpl(this.db);

  @override
  Future<List<Todo>> getList() => db.getTodos();

  @override
  Future<void> addTodo(TodosCompanion todo) async {
    await db.insertTodo(todo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await db.updateTodo(todo);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await db.deleteTodo(id);
  }
}