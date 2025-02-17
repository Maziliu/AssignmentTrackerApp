import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/assessment_table.dart';
import 'package:drift/drift.dart';

part 'drift_assessment_dao.g.dart';

@DriftAccessor(tables: [Assessments])
class DriftAssessmentDao extends DatabaseAccessor<AppDatabase>
    with _$DriftAssessmentDaoMixin {
  DriftAssessmentDao(super.attachedDatabase);

  Future<List<Assessment>> getAllAssessments({required int userId}) =>
      (select(assessments)
            ..where((assessment) => assessment.userId.equals(userId)))
          .get();

  Future<Assessment?> getAssessmentById(int assessmentId) =>
      (select(assessments)
            ..where((assessment) => assessment.id.equals(assessmentId)))
          .getSingleOrNull();

  Future<int> deleteAssessmentById(int assessmentId) => (delete(assessments)
        ..where((assessments) => assessments.id.equals(assessmentId)))
      .go();

  Future<int> insertAssessmentByCompanion(AssessmentsCompanion companion) =>
      into(assessments).insert(companion);

  Future<bool> updateAssessmentByCompanion(AssessmentsCompanion companion) =>
      update(assessments).replace(companion);
}
