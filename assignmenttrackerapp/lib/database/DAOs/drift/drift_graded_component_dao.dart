import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/graded_component_table.dart';
import 'package:drift/drift.dart';

part 'drift_graded_component_dao.g.dart';

@DriftAccessor(tables: [GradedComponents])
class DriftGradedComponentDao extends DatabaseAccessor<AppDatabase>
    with _$DriftGradedComponentDaoMixin {
  DriftGradedComponentDao(super.attachedDatabase);

  Future<GradedComponent?> getGradedComponentById(int gradedComponentId) =>
      (select(gradedComponents)
            ..where((gradedComponent) =>
                gradedComponent.id.equals(gradedComponentId)))
          .getSingleOrNull();

  Future<int> deleteGradedComponentById(int gradedComponentId) =>
      (delete(gradedComponents)
            ..where((gradedComponent) =>
                gradedComponent.id.equals(gradedComponentId)))
          .go();

  Future<int> insertGradedComponentByCompanion(
          GradedComponentsCompanion companion) =>
      into(gradedComponents).insert(companion);

  Future<bool> updateGradedComponentByCompanion(
          GradedComponentsCompanion companion) =>
      update(gradedComponents).replace(companion);
}
