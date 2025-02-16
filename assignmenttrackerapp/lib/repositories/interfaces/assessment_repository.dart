import 'package:assignmenttrackerapp/models/db_assessment.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class AssessmentRepository {
  Future<Result<DatabaseAssessment>> getAssessmentById({required int id});
  Future<Result<void>> createAssessment(
      {required DatabaseAssessment assessment});
  Future<Result<void>> updateAssessment(
      {required DatabaseAssessment assessment});
  Future<Result<void>> deleteAssessmentById({required int id});
}
