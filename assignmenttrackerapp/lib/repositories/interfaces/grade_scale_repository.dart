import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class GradeScaleRepository {
  Future<Result<DatabaseGradeScale>> findGradeScaleById({required int id});
  Future<Result<DatabaseGradeScale>> updateGradeScaleById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<Result<void>> deleteGradeScaleById({required int id});
  Future<Result<void>> insertGradeScale({required Map<String, Object?> values});
}
