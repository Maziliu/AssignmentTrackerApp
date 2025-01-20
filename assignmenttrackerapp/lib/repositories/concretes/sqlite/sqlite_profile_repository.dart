import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_profile.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/sqlite_base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/profile_repository.dart';

class SqliteProfileRepository extends SqliteBaseRepository implements ProfileRepository {
  @override
  Future<void> deleteProfileById({required int id})async {
    try {
      await deleteDatabaseEntryById(tableName: profileTableName, rowId: id);
    } on UnableToDeleteDatabaseEntryException {
      throw UnableToDeleteProfileException();
    }
  }

  @override
  Future<DatabaseProfile> findProfileById({required int id})async {
    // TODO: implement findProfileById
    throw UnimplementedError();
  }

  @override
  Future<void> insertProfile({required Map<String, Object?> values})async {
    // TODO: implement insertProfile
    throw UnimplementedError();
  }

  @override
  Future<DatabaseProfile> updateProfileById({required int id, required Map<String, Object?> updatedValues}) async{
    // TODO: implement updateProfileById
    throw UnimplementedError();
  }
}