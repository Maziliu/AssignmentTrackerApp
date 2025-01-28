import 'package:drift/drift.dart';

class GradedComponentTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get weightDecimal => real()();
  RealColumn get gradePercentage => real()();
  TextColumn get gradeLetter => text()();
}
