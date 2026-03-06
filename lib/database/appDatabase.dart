import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_application_1/todo.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:path_provider/path_provider.dart';
import 'todos.dart';
import 'package:path/path.dart' as p;
part 'appDatabase.g.dart';

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Todo>> getTodos() {
    return select(todos).get();
  }

  Future<int> insertTodo(TodosCompanion todo) {
    return into(todos).insert(todo);
  }

  Future<int> deleteTodo(int id) {
    return (delete(todos)..where((t) => t.id.equals(id))).go();
  }

  Future<bool> updateTodo(Todo todo) {
    return update(todos).replace(todo);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'todo.sqlite'));
    return NativeDatabase(file);
  });
}
