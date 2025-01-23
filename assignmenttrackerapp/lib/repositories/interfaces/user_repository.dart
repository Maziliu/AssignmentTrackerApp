import 'package:assignmenttrackerapp/models/db_user.dart';

abstract class UserRepository {
  Future<DatabaseUser> findUserById({required int id});
  Future<DatabaseUser> updateUserById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<void> deleteUserById({required int id});
  Future<void> insertUser({required Map<String, Object?> values});
}