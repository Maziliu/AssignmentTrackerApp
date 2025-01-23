import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/time_slot_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteTimeSlotRepository extends BaseRepository
    implements TimeSlotRepository {
  @override
  Future<void> deleteTimeSlotById({required int id}) async {
    await deleteDatabaseEntryById(tableName: timeSlotTableName, rowId: id);
  }

  @override
  Future<DatabaseTimeSlot> findTimeSlotById({required int id}) async {
    final Database database = await fetchOrCreateDatabase();
    final List<Map<String, Object?>> result = await database
        .query(timeSlotTableName, limit: 1, where: 'id = ?', whereArgs: [id]);

    if (result.isEmpty) throw UnableToFindTimeSlotException();

    return DatabaseTimeSlot.fromRow(result.first);
  }

  @override
  Future<void> insertTimeSlot({required Map<String, Object?> values}) async {
    await insertDatabaseEntry(tableName: timeSlotTableName, row: values);
  }

  @override
  Future<DatabaseTimeSlot> updateTimeSlotById(
      {required int id, required Map<String, Object?> updatedValues}) async {
    await updateDatabaseEntryById(
        tableName: timeSlotTableName, rowId: id, updatedValues: updatedValues);

    return await findTimeSlotById(id: id);
  }

  @override
  Future<List<DatabaseTimeSlot>> findTimeSlotsByReferenceId(
      {required int referenceId}) async {
    final Database database = await fetchOrCreateDatabase();
    final List<Map<String, Object?>> result = await database.query(
        timeSlotTableName,
        where: 'reference_id = ?',
        whereArgs: [referenceId]);

    if (result.isEmpty) throw UnableToFindTimeSlotException();

    return result.map((row) => DatabaseTimeSlot.fromRow(row)).toList();
  }
}
