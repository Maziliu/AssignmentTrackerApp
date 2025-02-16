import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class GradeScaleRepository {
  Future<Result<DatabaseGradeScale>> getGradeScaleById({required int id});
  Future<Result<void>> createGradeScale(
      {required DatabaseGradeScale gradeScale});
  Future<Result<void>> updateGradeScale(
      {required DatabaseGradeScale gradeScale});
  Future<Result<void>> deleteGradeScaleById({required int id});
}
