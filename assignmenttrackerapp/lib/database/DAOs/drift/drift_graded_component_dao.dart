import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/graded_component_table.dart';
import 'package:drift/drift.dart';

part 'drift_graded_component_dao.g.dart';

@DriftAccessor(tables: [GradedComponents])
class DriftGradedComponentDao extends DatabaseAccessor<AppDatabase>
    with _$DriftGradedComponentDaoMixin {
  DriftGradedComponentDao(super.attachedDatabase);
}
