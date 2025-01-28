import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class GradedComponentRepository {
  Future<Result<DatabaseGradedComponent>> findGradedComponentById({required int id});
  Future<Result<DatabaseGradedComponent>> updateGradedComponentById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<Result<void>> deleteGradedComponentById({required int id});
  Future<Result<void>> insertGradedComponent({required Map<String, Object?> values});
}
