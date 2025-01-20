import 'package:assignmenttrackerapp/models/db_course.dart';

abstract class CourseRepository {
  Future<DatabaseCourse> findCourseById({required int id});
  Future<DatabaseCourse> updateCourseById({
    required int courseId,
    required int? gradedComponentId,
    required int? gradeScaleId,
    required int? timeSlotId,
    required Map<String, Object?> updatedCourseValues,
    required Map<String, Object?>? updatedGradedComponentValues,
    required Map<String, Object?>? updatedGradeScaleValues,
    required Map<String, Object?>? updatedTimeSlotValues,
    required List<Map<String, Object?>>? updatedAdditionalEventsValues,
  });
  Future<void> deleteCourseById({required int id});
  Future<void> insertCourse({
    required Map<String, Object?> courseValues,
    required Map<String, Object?> gradedComponentValues,
    required Map<String, Object?> gradeScaleValues,
    required Map<String, Object?> timeSlotValues,
    required List<Map<String, Object?>>? additionalEventsValues,
  });
}
