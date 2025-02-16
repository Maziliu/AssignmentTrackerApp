import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class GradedComponentRepository {
  Future<Result<DatabaseGradedComponent>> getGrDatabaseGradedComponentById(
      {required int id});
  Future<Result<void>> createGrDatabaseGradedComponent(
      {required DatabaseGradedComponent gradedComponent});
  Future<Result<void>> updateGrDatabaseGradedComponent(
      {required DatabaseGradedComponent gradedComponent});
  Future<Result<void>> deleteGrDatabaseGradedComponentById({required int id});
}
