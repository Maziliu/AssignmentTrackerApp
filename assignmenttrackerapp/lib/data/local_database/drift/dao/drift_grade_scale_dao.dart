import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/grade_scale_table.dart';
import 'package:drift/drift.dart';

part 'drift_grade_scale_dao.g.dart';

@DriftAccessor(tables: [GradeScales])
class DriftGradeScaleDao extends DatabaseAccessor<AppDatabase>
    with _$DriftGradeScaleDaoMixin {
  DriftGradeScaleDao(super.attachedDatabase);

  Future<List<GradeScale>> getAllGradeScales({required int userId}) =>
      (select(gradeScales)
            ..where((gradeScale) => gradeScale.userId.equals(userId)))
          .get();

  Future<GradeScale?> getGradeScaleById(int gradeScaleId) =>
      (select(gradeScales)
            ..where((gradeScale) => gradeScale.id.equals(gradeScaleId)))
          .getSingleOrNull();

  Future<int> deleteGradeScaleById(int gradeScaleId) => (delete(gradeScales)
        ..where((gradeScale) => gradeScale.id.equals(gradeScaleId)))
      .go();

  Future<int> insertGradeScaleByCompanion(GradeScalesCompanion companion) =>
      into(gradeScales).insert(companion);

  Future<bool> updateGradeScaleByCompanion(GradeScalesCompanion companion) =>
      update(gradeScales).replace(companion);
}
