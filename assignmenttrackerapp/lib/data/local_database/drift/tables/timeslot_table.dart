import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:assignmenttrackerapp/core/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/core/enums/time_slot_type.dart';
import 'package:drift/drift.dart';

class Timeslots extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(Users, #cloudDBSyncId, onDelete: KeyAction.cascade)();
  IntColumn get endingDay => intEnum<DaysOfTheWeek>()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime()();
}
