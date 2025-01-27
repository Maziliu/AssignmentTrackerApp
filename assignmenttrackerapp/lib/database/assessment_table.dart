import 'package:assignmenttrackerapp/database/course_table.dart';
import 'package:assignmenttrackerapp/database/graded_component_table.dart';
import 'package:assignmenttrackerapp/enums/assessment_type.dart';
import 'package:drift/drift.dart';

class Assessments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get courseId =>
      integer().references(Courses, #id, onDelete: KeyAction.cascade)();
  IntColumn get gradedComponentId => integer()
      .references(GradedComponents, #id, onDelete: KeyAction.cascade)();
  TextColumn get assessmentName => text()();
  IntColumn get type => intEnum<AssessmentType>()();
  BoolColumn get isComplete => boolean()();
}
