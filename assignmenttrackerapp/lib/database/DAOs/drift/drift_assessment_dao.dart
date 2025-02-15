import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/assessment_table.dart';
import 'package:drift/drift.dart';

part 'drift_assessment_dao.g.dart';

@DriftAccessor(tables: [Assessments])
class DriftAssessmentDao extends DatabaseAccessor<AppDatabase>
    with _$DriftAssessmentDaoMixin {
  DriftAssessmentDao(super.attachedDatabase);
}
