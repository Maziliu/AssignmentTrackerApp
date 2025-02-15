import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/event_table.dart';
import 'package:drift/drift.dart';

part 'drift_event_dao.g.dart';

@DriftAccessor(tables: [Events])
class DriftEventDao extends DatabaseAccessor<AppDatabase>
    with _$DriftEventDaoMixin {
  DriftEventDao(super.attachedDatabase);
}
