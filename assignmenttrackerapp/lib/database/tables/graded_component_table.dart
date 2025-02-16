import 'package:assignmenttrackerapp/database/tables/user_table.dart';
import 'package:drift/drift.dart';

class GradedComponents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(Users, #cloudDBSyncId, onDelete: KeyAction.cascade)();
  RealColumn get weightDecimal => real()();
  RealColumn get gradePercentage => real()();
  TextColumn get gradeLetter => text()();
}
