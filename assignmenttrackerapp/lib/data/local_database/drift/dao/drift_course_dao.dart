import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/course_table.dart';
import 'package:drift/drift.dart';

part 'drift_course_dao.g.dart';

@DriftAccessor(tables: [Courses])
class DriftCourseDao extends DatabaseAccessor<AppDatabase> with _$DriftCourseDaoMixin {
  DriftCourseDao(super.attachedDatabase);

  Future<List<Course>> getAllCourses({required int userId}) => (select(courses)..where((course) => course.userId.equals(userId))).get();

  Future<Course?> getCourseById(int courseId) => (select(courses)..where((course) => course.id.equals(courseId))).getSingleOrNull();

  Future<int> deleteCourseById(int courseId) => (delete(courses)..where((course) => course.id.equals(courseId))).go();

  Future<int> insertCourseByCompanion(CoursesCompanion companion) => into(courses).insert(companion);

  Future<bool> updateCourseByCompanion(CoursesCompanion companion) => update(courses).replace(companion);
}
