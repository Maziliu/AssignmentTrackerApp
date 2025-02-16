import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class UserRepository {
  Future<Result<DatabaseUser>> getUserById({required int id});
  Future<Result<void>> createUser({required DatabaseUser user});
  Future<Result<void>> updateUser({required DatabaseUser user});
  Future<Result<void>> deleteUserById({required int id});
}
