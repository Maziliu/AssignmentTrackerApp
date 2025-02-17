import 'package:assignmenttrackerapp/data/models/app_model_course.dart';
import 'package:assignmenttrackerapp/core/utils/result.dart';

abstract class CourseRepository {
  Future<Result<AppModelCourse>> getCourseById({required int id});
  Future<Result<void>> createCourse({required AppModelCourse course});
  Future<Result<void>> updateCourse({required AppModelCourse course});
  Future<Result<void>> deleteCourseById({required int id});
}
