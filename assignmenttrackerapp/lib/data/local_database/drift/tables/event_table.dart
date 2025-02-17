import 'package:assignmenttrackerapp/data/local_database/drift/tables/timeslot_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:drift/drift.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.cascade)();
  IntColumn get timeslotId =>
      integer().references(Timeslots, #id, onDelete: KeyAction.cascade)();
  TextColumn get eventName => text()();
}
