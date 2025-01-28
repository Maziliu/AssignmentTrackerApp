import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/timeslot_table.dart';
import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

part 'drift_timeslots_dao.g.dart';

@DriftAccessor(tables: [Timeslots])
class DriftTimeslotsDao extends DatabaseAccessor<AppDatabase>
    with _$DriftTimeslotsDaoMixin
    implements TimeSlotRepository {
  DriftTimeslotsDao(super.attachedDatabase);

  @override
  Future<Result<void>> deleteTimeSlotById({required int id}) async {
    try {
      await (delete(db.timeslots)..where((timeslot) => timeslot.id.equals(id)))
          .go();

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteTimeSlotException());
    }
  }

  @override
  Future<Result<DatabaseTimeSlot>> findTimeSlotById({required int id}) async {
    try {
      final Timeslot? timeslot = await (select(db.timeslots)
            ..where((timeslot) => timeslot.id.equals(id)))
          .getSingleOrNull();

      if (timeslot == null) {
        return Result.error(UnableToFindTimeSlotException());
      }

      return Result.ok(_fromTimeslot(timeslot));
    } on Exception {
      return Result.error(UnableToFindTimeSlotException());
    }
  }

  @override
  Future<Result<List<DatabaseTimeSlot>>> findTimeSlotsByReferenceId(
      {required int referenceId}) async {
    try {
      final List<Timeslot> timeslots = await (select(db.timeslots)
            ..where((timeslot) => timeslot.referenceId.equals(referenceId)))
          .get();

      return Result.ok(
          timeslots.map((timeslot) => _fromTimeslot(timeslot)).toList());
    } on Exception {
      return Result.error(UnableToFindTimeSlotException());
    }
  }

  @override
  Future<Result<void>> insertTimeSlot(
      {required Map<String, Object?> values}) async {
    try {
      final TimeslotsCompanion companion = _createCompanion(values: values);

      await into(db.timeslots).insert(companion);

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToInsertTimeSlotException());
    }
  }

  @override
  Future<Result<DatabaseTimeSlot>> updateTimeSlotById(
      {required int id, required Map<String, Object?> updatedValues}) async {
    try {
      final TimeslotsCompanion companion =
          _createCompanion(id: id, values: updatedValues);

      await update(db.timeslots).write(companion);

      return findTimeSlotById(id: id);
    } on Exception {
      return Result.error(UnableToUpdateTimeSlotException());
    }
  }

  TimeslotsCompanion _createCompanion(
      {int? id, required Map<String, Object?> values}) {
    return TimeslotsCompanion(
      id: (id == null) ? Value.absent() : Value(id),
      referenceId: values['reference_id'] as Value<int>,
      type: values['type'] as Value<TimeSlotType>,
      endingDay: values['ending_day'] as Value<DaysOfTheWeek>,
      startDate: (values['starting_date'] == null)
          ? Value.absent()
          : values['starting_date'] as Value<DateTime>,
      endDate: values['end_date'] as Value<DateTime>,
    );
  }

  DatabaseTimeSlot _fromTimeslot(Timeslot timeslot) {
    return DatabaseTimeSlot(
      id: timeslot.id,
      referenceId: timeslot.referenceId,
      type: timeslot.type,
      endingDay: timeslot.endingDay,
      startDate: timeslot.startDate,
      endDate: timeslot.endDate,
    );
  }
}
