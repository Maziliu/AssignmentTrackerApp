import 'package:assignmenttrackerapp/models/db_assesment.dart';

abstract class AssessmentRepository {
  Future<DatabaseAssesment> findAssessmentById({required int id});
  Future<DatabaseAssesment> updateAssessmentById({
    required int assessmentId,
    required int? gradedComponentId,
    required int? timeSlotId,
    required Map<String, Object?> updatedAssessmentValues,
    required Map<String, Object?>? updatedGradedComponentValues,
    required Map<String, Object?>? updatedTimeSlotValues,
  });
  Future<void> deleteAssessmentById({required int id});
  Future<void> insertAssessment({
    required Map<String, Object?> assessmentValues,
    required Map<String, Object?> gradedComponentValues,
    required Map<String, Object?> timeSlotValues,
  });
}