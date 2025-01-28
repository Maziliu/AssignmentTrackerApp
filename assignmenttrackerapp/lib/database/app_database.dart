import 'package:assignmenttrackerapp/database/assessment_table.dart';
import 'package:assignmenttrackerapp/database/course_table.dart';
import 'package:assignmenttrackerapp/database/event_table.dart';
import 'package:assignmenttrackerapp/database/grade_scale_table.dart';
import 'package:assignmenttrackerapp/database/graded_component_table.dart';
import 'package:assignmenttrackerapp/database/timeslot_table.dart';
import 'package:assignmenttrackerapp/database/user_table.dart';
import 'package:assignmenttrackerapp/enums/assessment_type.dart';
import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [
  Assessments,
  Courses,
  Events,
  GradeScales,
  GradedComponents,
  Timeslots,
  Users
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'sqlite_database',
      native: const DriftNativeOptions(
          databaseDirectory: getApplicationSupportDirectory),
    );
  }
}
