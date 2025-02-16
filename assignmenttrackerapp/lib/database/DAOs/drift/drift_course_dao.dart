import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/course_table.dart';
import 'package:drift/drift.dart';

part 'drift_course_dao.g.dart';

@DriftAccessor(tables: [Courses])
class DriftCourseDao extends DatabaseAccessor<AppDatabase>
    with _$DriftCourseDaoMixin {
  DriftCourseDao(super.attachedDatabase);

  Future<List<Course>> getAllCourses({required String cloudDBSyncId}) =>
      (select(courses)..where((course) => course.userId.equals(cloudDBSyncId)))
          .get();

  Future<Course?> getCourseById(int courseId) =>
      (select(courses)..where((course) => course.id.equals(courseId)))
          .getSingleOrNull();

  Future<int> deleteCourseById(int courseId) =>
      (delete(courses)..where((course) => course.id.equals(courseId))).go();

  Future<int> insertCourseByCompanion(CoursesCompanion companion) =>
      into(courses).insert(companion);

  Future<bool> updateCourseByCompanion(CoursesCompanion companion) =>
      update(courses).replace(companion);
}
