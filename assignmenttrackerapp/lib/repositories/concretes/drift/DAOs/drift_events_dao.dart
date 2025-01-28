import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/event_table.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';
part '../../../../database/generated/drift_events_dao.g.dart';

@DriftAccessor(tables: [Events])
class DriftEventsDao extends DatabaseAccessor<AppDatabase>
    with _$DriftEventsDaoMixin
    implements EventRepository {
  final TimeSlotRepository _timeSlotRepository;

  DriftEventsDao(super.attachedDatabase,
      {required TimeSlotRepository timeSlotRepository})
      : _timeSlotRepository = timeSlotRepository;

  @override
  Future<Result<void>> deleteEventById({required int id}) async {
    try {
      await (delete(events)..where((event) => event.id.equals(id))).go();

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteEventException());
    }
  }

  @override
  Future<Result<DatabaseEvent>> findEventById({required int id}) async {
    try {
      final Event? event = await (select(events)
            ..where((event) => event.id.equals(id)))
          .getSingleOrNull();

      if (event == null) {
        return Result.error(UnableToFindEventException());
      }

      final Result<List<DatabaseTimeSlot>> result = await _timeSlotRepository
          .findTimeSlotsByReferenceId(referenceId: event.id);

      if (result is Error) {
        return Result.error(UnableToFindEventException());
      }

      return Result.ok(
          _fromEvent(event: event, timeslots: (result as Ok).value));
    } on Exception {
      return Result.error(UnableToFindEventException());
    }
  }

  @override
  Future<Result<void>> insertEvent(
      {required Map<String, Object?> eventValues,
      required List<Map<String, Object?>> timeSlotValuesList}) async {
    try {
      final EventsCompanion companion = _createCompanion(values: eventValues);

      await into(events).insert(companion);

      final List<Result> results =
          await Future.wait(timeSlotValuesList.map((timeslotValues) async {
        return await _timeSlotRepository.insertTimeSlot(values: timeslotValues);
      }));

      for (Result result in results) {
        if (result is Error) {
          return Result.error(UnableToInsertEventException());
        }
      }

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToInsertEventException());
    }
  }

  @override
  Future<Result<DatabaseEvent>> updateEventById(
      {required int eventId,
      required Map<String, Object?> updatedEventValues,
      int? timeSlotId,
      Map<String, Object?>? updatedTimeSlotValues}) async {
    try {
      final EventsCompanion companion =
          _createCompanion(id: eventId, values: updatedEventValues);

      await update(events).write(companion);

      if (timeSlotId != null) {
        final Result result = await _timeSlotRepository.updateTimeSlotById(
            id: timeSlotId, updatedValues: updatedTimeSlotValues!);

        if (result is Error) {
          return Result.error(UnableToInsertEventException());
        }
      }

      return await findEventById(id: eventId);
    } on Exception {
      return Result.error(UnableToInsertEventException());
    }
  }

  EventsCompanion _createCompanion(
      {int? id, required Map<String, Object?> values}) {
    return EventsCompanion(
      id: (id == null) ? Value.absent() : Value(id),
      eventName: values['event_name'] as Value<String>,
    );
  }

  DatabaseEvent _fromEvent(
      {required Event event, required List<DatabaseTimeSlot> timeslots}) {
    return DatabaseEvent(
        id: event.id,
        userId: event.userId,
        eventName: event.eventName,
        timeSlots: timeslots);
  }
}
