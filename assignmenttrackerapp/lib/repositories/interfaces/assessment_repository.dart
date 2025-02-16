import 'package:assignmenttrackerapp/models/app_model_assessment.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class AssessmentRepository {
  Future<Result<AppModelAssessment>> getAssessmentById({required int id});
  Future<Result<void>> createAssessment(
      {required AppModelAssessment assessment});
  Future<Result<void>> updateAssessment(
      {required AppModelAssessment assessment});
  Future<Result<void>> deleteAssessmentById({required int id});
}
