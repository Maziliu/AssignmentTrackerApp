import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:drift/drift.dart';

import '../../tables/timeslot_table.dart';

part 'drift_timeslot_dao.g.dart';

@DriftAccessor(tables: [Timeslots])
class DriftTimeslotDao extends DatabaseAccessor<AppDatabase>
    with _$DriftTimeslotDaoMixin {
  DriftTimeslotDao(super.attachedDatabase);

  Future<Timeslot?> getTimeslotById(int timeslotId) =>
      (select(timeslots)..where((timeslot) => timeslot.id.equals(timeslotId)))
          .getSingleOrNull();

  Future<List<Timeslot>> getAllTimeslotsForEventId(int eventId) =>
      (select(timeslots)..where((timeslot) => timeslot.eventId.equals(eventId)))
          .get();

  Future<int> deleteTimeslotById(int timeslotId) =>
      (delete(timeslots)..where((timeslot) => timeslot.id.equals(timeslotId)))
          .go();

  Future<int> insertTimeslot(TimeslotsCompanion companion) =>
      into(timeslots).insert(companion);

  Future<bool> updateTimeslot(TimeslotsCompanion companion) =>
      update(timeslots).replace(companion);
}
