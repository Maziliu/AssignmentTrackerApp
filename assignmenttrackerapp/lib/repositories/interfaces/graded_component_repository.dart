import 'package:assignmenttrackerapp/models/db_graded_component.dart';

abstract class GradedComponentRepository {
  Future<DatabaseGradedComponent> findGradedComponentById({required int id});
  Future<DatabaseGradedComponent> updateGradedComponentById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<void> deleteGradedComponentById({required int id});
  Future<void> insertGradedComponent({required Map<String, Object?> values});
}
