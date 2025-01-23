import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/user_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteUserRepository extends BaseRepository implements UserRepository {
  @override
  Future<void> deleteUserById({required int id}) async {
    try {
      await deleteDatabaseEntryById(tableName: userTableName, rowId: id);
    } on UnableToDeleteDatabaseEntryException {
      throw UnableToDeleteUserException();
    }
  }

  @override
  Future<DatabaseUser> findUserById({required int id}) async {
    Database database = await fetchOrCreateDatabase();

    final List<Map<String, Object?>> result = await database.query(userTableName, limit: 1, where: 'id = ?', whereArgs: [id]);

    if(result.isEmpty) throw UnableToFindUserException();

    return DatabaseUser.fromRow(result.first);
  }

  @override
  Future<void> insertUser({required Map<String, Object?> values}) async {
    try {
      await insertDatabaseEntry(tableName: userTableName, row: values);
    } on UnableToInsertDatabaseEntryException {
      throw UnableToInsertUserException();
    }
  }

  @override
  Future<DatabaseUser> updateUserById({required int id, required Map<String, Object?> updatedValues}) async {
    try {
      await updateDatabaseEntryById(tableName: userTableName, rowId: id, updatedValues: updatedValues);
      return await findUserById(id: id);
    } on UnableToUpdateDatabaseEntryException {
      throw UnableToUpdateUserException();
    }
  }
}