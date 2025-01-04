import 'package:assignmenttrackerapp/services/database/database_handler.dart';

abstract class DatabaseService<T> with DatabaseHandler {
  late final String tableName;

  DatabaseService(this.tableName);

  T mapRowToModel(Map<String, Object?> row);

  // CRUD Operations
  Future<int> insertRecord(Map<String, Object?> row) async {
    await checkDbIsOpen();
    final database = getDatabase();
    return await database.insert(tableName, row);
  }

  Future<Iterable> getRecordById(int id) async {
    await checkDbIsOpen();
    final database = getDatabase();
    return await database.query(
      tableName,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<T>> getAllRecords() async {
    await checkDbIsOpen();
    final database = getDatabase();
    final results = await database.query(tableName);
    return results.map((row) => mapRowToModel(row)).toList();
  }

  Future<int> updateRecord(int id, Map<String, Object?> row) async {
    await checkDbIsOpen();
    final database = getDatabase();
    return await database
        .update(tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteRecord(int id) async {
    await checkDbIsOpen();
    final database = getDatabase();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllRecords() async {
    await checkDbIsOpen();
    final database = getDatabase();

    return await database.delete(tableName);
  }
}
