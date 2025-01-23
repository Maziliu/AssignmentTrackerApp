import 'package:assignmenttrackerapp/repositories/concretes/sqlite/sqlite_database_access_handler.dart';

abstract class DatabaseService<T> with SqliteDatabaseAccessHandler {
  late final String _tableName;

  DatabaseService(String tableName) : _tableName = tableName;

  T mapRowToModel(Map<String, Object?> row);

  // CRUD Operations
  Future<int> insertRecord(Map<String, Object?> row) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();
    return await database.insert(tableName, row);
  }

  Future<Iterable> getRecordById(int id) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();
    return await database.query(
      tableName,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<T>> getRecordBySpecifications(
      Map<String, Object?> specifications) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();

    String? whereString;
    List<Object?>? whereArgs;

    if (specifications.isNotEmpty) {
      whereString = specifications.keys.map((key) => '$key = ?').join(' AND ');
      whereArgs = specifications.values.toList();
    }

    final results = await database.query(
      tableName,
      where: whereString,
      whereArgs: whereArgs,
    );

    return results.map((row) => mapRowToModel(row)).toList();
  }

  Future<List<T>> getAllRecords() async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();
    final results = await database.query(tableName);
    return results.map((row) => mapRowToModel(row)).toList();
  }

  Future<int> updateRecordById(int id, Map<String, Object?> row) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();
    return await database
        .update(tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteRecordById(int id) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllRecords() async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();

    return await database.delete(tableName);
  }

  String get tableName => _tableName;
}
