import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get date => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
}
