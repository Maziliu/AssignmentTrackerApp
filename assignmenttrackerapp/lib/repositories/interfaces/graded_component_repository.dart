import 'package:assignmenttrackerapp/models/app_model_graded_component.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class GradedComponentRepository {
  Future<Result<AppModelGradedComponent>> getGrDatabaseGradedComponentById(
      {required int id});
  Future<Result<void>> createGrDatabaseGradedComponent(
      {required AppModelGradedComponent gradedComponent});
  Future<Result<void>> updateGrDatabaseGradedComponent(
      {required AppModelGradedComponent gradedComponent});
  Future<Result<void>> deleteGrDatabaseGradedComponentById({required int id});
}
