import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class UserRepository {
  Future<Result<DatabaseUser>> findUserById({required int id});
  Future<Result<DatabaseUser>> updateUserById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<Result<void>> deleteUserById({required int id});
  Future<Result<void>> insertUser({required Map<String, Object?> values});
}
