import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/database_handler.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqliteBaseRepository with DatabaseHandler {
  Future<int> insertDatabaseEntry(
      {required String tableName, required Map<String, Object?> row}) async {
    Database database = await fetchOrCreateDatabase();

    int insertionResultId = await database.insert(tableName, row);

    if (insertionResultId == 0) throw UnableToInsertDatabaseEntryException();

    return insertionResultId;
  }

  Future<void> updateDatabaseEntryById(
      {required String tableName,
      required int rowId,
      required Map<String, Object?> updatedValues}) async {
    Database database = await fetchOrCreateDatabase();

    int rowsUpdated = await database
        .update(tableName, updatedValues, where: 'id = ?', whereArgs: [rowId]);
    if (rowsUpdated == 0) throw UnableToUpdateDatabaseEntryException();
  }

  Future<void> deleteDatabaseEntryById(
      {required String tableName, required int rowId}) async {
    Database database = await fetchOrCreateDatabase();

    int rowsDeleted =
        await database.delete(tableName, where: 'id = ?', whereArgs: [rowId]);
    if (rowsDeleted == 0) throw UnableToDeleteDatabaseEntryException();
  }
}
