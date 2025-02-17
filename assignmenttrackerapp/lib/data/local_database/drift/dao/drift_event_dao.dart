import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/event_table.dart';
import 'package:drift/drift.dart';

part 'drift_event_dao.g.dart';

@DriftAccessor(tables: [Events])
class DriftEventDao extends DatabaseAccessor<AppDatabase>
    with _$DriftEventDaoMixin {
  DriftEventDao(super.attachedDatabase);

  Future<List<Event>> getAllEvents({required int userId}) =>
      (select(events)..where((event) => event.userId.equals(userId))).get();

  Future<Event?> getEventById(int eventId) =>
      (select(events)..where((event) => event.id.equals(eventId)))
          .getSingleOrNull();

  Future<int> deleteEventById(int eventId) =>
      (delete(events)..where((event) => event.id.equals(eventId))).go();

  Future<int> insertEventByCompanion(EventsCompanion companion) =>
      into(events).insert(companion);

  Future<bool> updateEventByCompanion(EventsCompanion companion) =>
      update(events).replace(companion);

  Future<Event?> getEventByTimeslotId(int timeslotId) =>
      (select(events)..where((event) => event.timeslotId.equals(timeslotId)))
          .getSingleOrNull();
}
