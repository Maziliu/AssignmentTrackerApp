import 'package:assignmenttrackerapp/database/grade_scale_table.dart';
import 'package:assignmenttrackerapp/database/graded_component_table.dart';
import 'package:assignmenttrackerapp/database/user_table.dart';
import 'package:drift/drift.dart';

class Courses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.cascade)();
  IntColumn get gradedScaleId =>
      integer().references(GradeScales, #id, onDelete: KeyAction.cascade)();
  IntColumn get gradedComponentId => integer()
      .references(GradedComponents, #id, onDelete: KeyAction.cascade)();
  TextColumn get courseName => text()();
  TextColumn get courseCode => text()();
  IntColumn get scheduleBitMask => integer()();
}