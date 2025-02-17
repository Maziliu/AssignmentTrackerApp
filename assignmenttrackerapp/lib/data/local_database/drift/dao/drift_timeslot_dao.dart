import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:drift/drift.dart';

import '../tables/timeslot_table.dart';

part 'drift_timeslot_dao.g.dart';

@DriftAccessor(tables: [Timeslots])
class DriftTimeslotDao extends DatabaseAccessor<AppDatabase>
    with _$DriftTimeslotDaoMixin {
  DriftTimeslotDao(super.attachedDatabase);

  Future<List<Timeslot>> getAllTimeslots({required int userId}) =>
      (select(timeslots)..where((timeslot) => timeslot.userId.equals(userId)))
          .get();

  Future<Timeslot?> getTimeslotById(int timeslotId) =>
      (select(timeslots)..where((timeslot) => timeslot.id.equals(timeslotId)))
          .getSingleOrNull();

  Future<int> deleteTimeslotById(int timeslotId) =>
      (delete(timeslots)..where((timeslot) => timeslot.id.equals(timeslotId)))
          .go();

  Future<int> insertTimeslotByCompanion(TimeslotsCompanion companion) =>
      into(timeslots).insert(companion);

  Future<bool> updateTimeslotByCompanion(TimeslotsCompanion companion) =>
      update(timeslots).replace(companion);

  Future<List<Timeslot>> getAllTimeslotsBefore({
    required int userId,
    required DateTime date,
  }) {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day, 0, 0, 0);

    return (select(timeslots)
          ..where((timeslot) =>
              timeslot.endDate.isBetweenValues(startOfToday, date))
          ..where((timeslot) => timeslot.userId.equals(userId)))
        .get();
  }
}
