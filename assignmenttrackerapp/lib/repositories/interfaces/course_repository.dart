import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class CourseRepository {
  Future<Result<DatabaseCourse>> getCourseById({required int id});
  Future<Result<void>> createCourse({required DatabaseCourse course});
  Future<Result<void>> updateCourse({required DatabaseCourse course});
  Future<Result<void>> deleteCourseById({required int id});
}
