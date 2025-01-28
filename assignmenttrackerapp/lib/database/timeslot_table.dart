import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';
import 'package:drift/drift.dart';

class Timeslots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get referenceId => integer()();
  IntColumn get type => intEnum<TimeSlotType>()();
  IntColumn get endingDay => intEnum<DaysOfTheWeek>()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime()();
}
