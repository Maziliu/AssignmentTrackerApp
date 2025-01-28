import 'package:drift/drift.dart';

class EventTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventName => text()();
}
