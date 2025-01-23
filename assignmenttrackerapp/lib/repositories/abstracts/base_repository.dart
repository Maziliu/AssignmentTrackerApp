import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';
import 'package:assignmenttrackerapp/repositories/concretes/sqlite/sqlite_database_access_handler.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/database_accesser.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseRepository{
  final DatabaseAccesser _databaseAccessHandler;

  BaseRepository({required DatabaseAccesser databaseAccessHandler}) : _databaseAccessHandler = databaseAccessHandler;

  Future<int> insertDatabaseEntry(
      {required String tableName, required Map<String, Object?> row}) async {
    Database database = await _databaseAccessHandler.fetchOrCreateDatabase();

    int insertionResultId = await database.insert(tableName, row);

    if (insertionResultId == 0) throw UnableToInsertDatabaseEntryException();

    return insertionResultId;
  }

  Future<void> updateDatabaseEntryById(
      {required String tableName,
      required int rowId,
      required Map<String, Object?> updatedValues}) async {
    Database database = await _databaseAccessHandler.fetchOrCreateDatabase();

    int rowsUpdated = await database
        .update(tableName, updatedValues, where: 'id = ?', whereArgs: [rowId]);
    if (rowsUpdated == 0) throw UnableToUpdateDatabaseEntryException();
  }

  Future<void> deleteDatabaseEntryById(
      {required String tableName, required int rowId}) async {
    Database database = await _databaseAccessHandler.fetchOrCreateDatabase();

    int rowsDeleted =
        await database.delete(tableName, where: 'id = ?', whereArgs: [rowId]);
    if (rowsDeleted == 0) throw UnableToDeleteDatabaseEntryException();
  }

  Future<Database> getDatabaseInstance() async {
    return _databaseAccessHandler.fetchOrCreateDatabase();
  }
}
