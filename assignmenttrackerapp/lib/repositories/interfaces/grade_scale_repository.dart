import 'package:assignmenttrackerapp/models/app_model_grade_scale.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class GradeScaleRepository {
  Future<Result<AppModelGradeScale>> getGradeScaleById({required int id});
  Future<Result<void>> createGradeScale(
      {required AppModelGradeScale gradeScale});
  Future<Result<void>> updateGradeScale(
      {required AppModelGradeScale gradeScale});
  Future<Result<void>> deleteGradeScaleById({required int id});
}
