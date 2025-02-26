import 'package:assignmenttrackerapp/data/models/app_model_user.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';

abstract class UserRepository {
  Future<Result<AppModelUser>> getUserById({required int id});
  Future<Result<void>> createUser({required AppModelUser user});
  Future<Result<void>> updateUser({required AppModelUser user});
  Future<Result<void>> deleteUserById({required int id});
  Future<Result<int>> getUserByCloudSyncId({required String? cloudSyncId});
}
