
import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/graded_component_table.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/graded_component_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';
part '../../../../database/generated/drift_graded_components_dao.g.dart';

@DriftAccessor(tables: [GradedComponents])
class DriftGradedComponentsDao extends DatabaseAccessor<AppDatabase> with _$DriftGradedComponentsDaoMixin implements GradedComponentRepository {
  DriftGradedComponentsDao(super.attachedDatabase);

  @override
  Future<Result<void>> deleteGradedComponentById({required int id}) async {
    try {
      await (delete(gradedComponents)..where((gradedCompnent) => gradedCompnent.id.equals(id))).go();
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteGradedComponentException());
    }
  }

  @override
  Future<Result<DatabaseGradedComponent>> findGradedComponentById({required int id}) async {
    try {
      final GradedComponent? gradedComponent = await (select(gradedComponents)..where((gradedComponent) => gradedComponent.id.equals(id))).getSingleOrNull();

      if(gradedComponent == null) {
        return Result.error(UnableToFindGradedComponentException());
      }

      return Result.ok(_fromGradedComponent(gradedComponent));

    } on Exception {
      return Result.error(UnableToFindGradedComponentException());
    }
  }

  @override
  Future<Result<void>> insertGradedComponent({required Map<String, Object?> values}) async {
    try {
      final GradedComponentsCompanion companion = _createCompanion(values: values);
      
      await into(gradedComponents).insert(companion);

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToInsertGradedComponentException());
    }
  }

  @override
  Future<Result<DatabaseGradedComponent>> updateGradedComponentById({required int id, required Map<String, Object?> updatedValues}) async {
    try {
      final GradedComponentsCompanion companion = _createCompanion(values: updatedValues, id: id);

      await update(gradedComponents).write(companion);

      return await findGradedComponentById(id: id);

    } on Exception {
      return Result.error(UnableToUpdateGradedComponentException());
    }
  }

  DatabaseGradedComponent _fromGradedComponent(GradedComponent gradedComponent) {
    return DatabaseGradedComponent(id: gradedComponent.id, weightDecimal: gradedComponent.weightDecimal, gradePercentage: gradedComponent.gradePercentage, gradeLetter: gradedComponent.gradeLetter,);
  }

  GradedComponentsCompanion _createCompanion({int? id, required Map<String, Object?> values}) {
    return GradedComponentsCompanion(
      id: (id == null) ? Value.absent() : Value(id),
      weightDecimal: values['weight_decimal'] as Value<double>,
      gradePercentage: values['grade_percentage'] as Value<double>,
      gradeLetter: values['grade_letter'] as Value<String>,
    );
  }
}