import 'package:assignmenttrackerapp/database/tables/user_table.dart';
import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';
import 'package:drift/drift.dart';

class Timeslots extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(Users, #cloudDBSyncId, onDelete: KeyAction.cascade)();
  IntColumn get eventId => integer()();
  IntColumn get endingDay => intEnum<DaysOfTheWeek>()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime()();
}
