import 'package:assignmenttrackerapp/data/local_database/drift/tables/course_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/event_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/graded_component_table.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:assignmenttrackerapp/core/enums/assessment_type.dart';
import 'package:drift/drift.dart';

class Assessments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(Users, #cloudDBSyncId, onDelete: KeyAction.cascade)();
  IntColumn get courseId =>
      integer().references(Courses, #id, onDelete: KeyAction.cascade)();
  IntColumn get gradedComponentId => integer()
      .references(GradedComponents, #id, onDelete: KeyAction.cascade)();
  IntColumn get eventId =>
      integer().references(Events, #id, onDelete: KeyAction.cascade)();
  TextColumn get assessmentName => text()();
  IntColumn get type => intEnum<AssessmentType>()();
  BoolColumn get isComplete => boolean()();
}
