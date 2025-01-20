import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/sqlite_base_repository.dart';
import 'package:assignmenttrackerapp/repositories/concretes/sqlite_time_slot_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/time_slot_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteEventRepository extends SqliteBaseRepository
    implements EventRepository {
  final TimeSlotRepository _sqliteTimeSlotRepository;

  SqliteEventRepository(
      {required SqliteTimeSlotRepository sqliteTimeSlotRepository})
      : _sqliteTimeSlotRepository = sqliteTimeSlotRepository;

  @override
  Future<void> deleteEventById({required int id}) async {
    await deleteDatabaseEntryById(tableName: eventTableName, rowId: id);
  }

  @override
  Future<DatabaseEvent> findEventById({required int id}) async {
    final Database database = await fetchOrCreateDatabase();
    final List<Map<String, Object?>> eventResult = await database
        .query(eventTableName, limit: 1, where: 'id = ?', whereArgs: [id]);

    if (eventResult.isEmpty) throw UnableToFindEventException();

    final List<DatabaseTimeSlot> eventTimeSlots =
        await _sqliteTimeSlotRepository.findTimeSlotsByReferenceId(
            referenceId: id);

    final combinedResult = {
      ...eventResult.first,
      ...{'time_slots': eventTimeSlots}
    };

    return DatabaseEvent.fromRow(combinedResult);
  }

  @override
  Future<void> insertEvent(
      {required Map<String, Object?> eventValues,
      required Map<String, Object?> timeSlotValues}) async {
    try {
      await insertDatabaseEntry(tableName: eventTableName, row: eventValues);
      await _sqliteTimeSlotRepository.insertTimeSlot(values: timeSlotValues);
    } on UnableToInsertDatabaseEntryException {
      throw UnableToInsertEventException();
    }
  }

  @override
  Future<DatabaseEvent> updateEventById(
      {required int eventId,
      int? timeSlotId,
      Map<String, Object?>? updatedEventValues,
      Map<String, Object?>? updatedTimeSlotValues}) async {
    if (updatedEventValues == null && updatedTimeSlotValues == null) {
      throw SimultaneousNullEventAndTimeSlotException();
    }

    if (updatedEventValues != null) {
      await updateDatabaseEntryById(
          tableName: eventTableName,
          rowId: eventId,
          updatedValues: updatedEventValues);
    }

    if (updatedTimeSlotValues != null && timeSlotId != null) {
      await _sqliteTimeSlotRepository.updateTimeSlotById(
          id: timeSlotId, updatedValues: updatedTimeSlotValues);
    }

    return await findEventById(id: eventId);
  }
}
