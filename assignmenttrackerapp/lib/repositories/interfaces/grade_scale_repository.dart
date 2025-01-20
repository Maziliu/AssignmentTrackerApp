import 'package:assignmenttrackerapp/models/db_grade_scale.dart';

abstract class GradeScaleRepository {
  Future<DatabaseGradeScale> findGradeScaleById({required int id});
  Future<DatabaseGradeScale> updateGradeScaleById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<void> deleteGradeScaleById({required int id});
  Future<void> insertGradeScale({required Map<String, Object?> values});
}
