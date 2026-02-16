import 'package:flutter_application_1/database/add_database.dart';
import 'package:flutter_application_1/todo.dart';

abstract class TodoRepository {
  Future <List<Todo>> getList();
}
class TodorepositoryImpl implements TodoRepository{
  final AppDatabase db;
  TodorepositoryImpl(this.db);
  
  @override
  Future<List<Todo>> getList() => db.getList();
  }