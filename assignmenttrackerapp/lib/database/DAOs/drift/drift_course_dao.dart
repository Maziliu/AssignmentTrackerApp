import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/course_table.dart';
import 'package:drift/drift.dart';

part 'drift_course_dao.g.dart';

@DriftAccessor(tables: [Courses])
class DriftCourseDao extends DatabaseAccessor<AppDatabase>
    with _$DriftCourseDaoMixin {
  DriftCourseDao(super.attachedDatabase);
}
