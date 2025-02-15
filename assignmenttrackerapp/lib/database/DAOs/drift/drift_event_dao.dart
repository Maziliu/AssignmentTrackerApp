import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/event_table.dart';
import 'package:drift/drift.dart';

part 'drift_event_dao.g.dart';

@DriftAccessor(tables: [Events])
class DriftEventDao extends DatabaseAccessor<AppDatabase>
    with _$DriftEventDaoMixin {
  DriftEventDao(super.attachedDatabase);

  Future<Event?> getEventById(int eventId) =>
      (select(events)..where((event) => event.id.equals(eventId)))
          .getSingleOrNull();

  Future<int> deleteEventById(int eventId) =>
      (delete(events)..where((event) => event.id.equals(eventId))).go();

  Future<int> insertEventByCompanion(EventsCompanion companion) =>
      into(events).insert(companion);

  Future<bool> updateEventByCompanion(EventsCompanion companion) =>
      update(events).replace(companion);
}
