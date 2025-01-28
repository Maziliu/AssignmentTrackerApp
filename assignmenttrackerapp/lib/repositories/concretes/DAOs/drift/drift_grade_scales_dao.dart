
import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/grade_scale_table.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/grade_scale_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

part '../../../../database/generated/drift_grade_scales_dao.g.dart';

@DriftAccessor(tables: [GradeScales])
class DriftGradeScalesDao extends DatabaseAccessor<AppDatabase> with _$DriftGradeScalesDaoMixin implements GradeScaleRepository{
  DriftGradeScalesDao(super.attachedDatabase);

  @override
  Future<Result<void>> deleteGradeScaleById({required int id}) async {
    try{
      await (delete(gradeScales)..where((gradeScale) => gradeScale.id.equals(id))).go();

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteGradeScaleException());
    }
  }

  @override
  Future<Result<DatabaseGradeScale>> findGradeScaleById({required int id}) async {
    try {
      final GradeScale? gradeScale = await (select(gradeScales)..where((gradeScale) => gradeScale.id.equals(id))).getSingleOrNull();
      
      if(gradeScale == null) {
        return Result.error(UnableToFindGradeScaleException());
      }

      return Result.ok(_fromGradeScale(gradeScale));

    } on Exception {
      return Result.error(UnableToFindGradeScaleException());
    }
  }

  @override
  Future<Result<void>> insertGradeScale({required Map<String, Object?> values}) async {
    try {
      GradeScalesCompanion companion = _createCompanion(values: values);

      await into(gradeScales).insert(companion);

      return Result.ok(null);

    } on Exception {
      return Result.error(UnableToFindGradeScaleException());
    }
  }

  @override
  Future<Result<DatabaseGradeScale>> updateGradeScaleById({required int id, required Map<String, Object?> updatedValues}) async {
    try {
      GradeScalesCompanion companion = _createCompanion(values: updatedValues, id: id);

      await update(gradeScales).write(companion);

      return await findGradeScaleById(id: id);

    } on Exception {
      return Result.error(UnableToUpdateGradeScaleException());
    }
  }

  GradeScalesCompanion _createCompanion({int? id, required Map<String, Object?> values}) {
    return GradeScalesCompanion(
      id: (id == null) ? Value.absent() : Value(id),
      thresholdsJson: values['thresholds_json'] as Value<String>,
    );
  }

  DatabaseGradeScale _fromGradeScale(GradeScale gradeScale) {
    return DatabaseGradeScale(id: gradeScale.id, thresholdsJson: gradeScale.thresholdsJson,);
  }
}