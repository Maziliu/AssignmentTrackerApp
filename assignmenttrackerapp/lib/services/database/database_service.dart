import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/services/database/database_handler.dart';

abstract class DatabaseService<T> with DatabaseHandler {
  late final String tableName;
  late final CacheStream<DatabaseObject>? _cache;

  DatabaseService(this.tableName, CacheStream<DatabaseObject> cache)
      : _cache = cache;

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

  void dispose() {
    if (_cache != null) {
      _cache.dispose();
    }
  }

  CacheStream<DatabaseObject> get cache => _cache!;
}
