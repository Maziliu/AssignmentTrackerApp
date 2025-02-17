import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:assignmenttrackerapp/common/enums/days_of_the_week.dart';
import 'package:drift/drift.dart';

class Timeslots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.cascade)();
  IntColumn get endingDay => intEnum<DaysOfTheWeek>()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime()();
}
