import 'package:assignmenttrackerapp/database/tables/user_table.dart';
import 'package:drift/drift.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(Users, #cloudDBSyncId, onDelete: KeyAction.cascade)();
  TextColumn get eventName => text()();
}
