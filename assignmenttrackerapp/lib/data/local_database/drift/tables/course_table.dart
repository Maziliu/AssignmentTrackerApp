import 'package:assignmenttrackerapp/data/local_database/drift/tables/event_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/grade_scale_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/graded_component_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:drift/drift.dart';

class Courses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(Users, #cloudDBSyncId, onDelete: KeyAction.cascade)();
  IntColumn get gradeScaleId =>
      integer().references(GradeScales, #id, onDelete: KeyAction.cascade)();
  IntColumn get gradedComponentId => integer()
      .references(GradedComponents, #id, onDelete: KeyAction.cascade)();
  IntColumn get eventId =>
      integer().references(Events, #id, onDelete: KeyAction.cascade)();
  TextColumn get courseName => text()();
  TextColumn get courseCode => text()();
  IntColumn get scheduleBitMask => integer()();
}
