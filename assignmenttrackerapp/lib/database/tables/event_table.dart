import 'package:assignmenttrackerapp/database/tables/user_table.dart';
import 'package:drift/drift.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get eventName => text()();
}
