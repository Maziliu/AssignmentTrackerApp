import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_user_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/common/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_user.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/user_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:drift/drift.dart';

class DriftUserRepository implements UserRepository, DriftRepository {
  final DriftUserDao _driftUserDao;

  DriftUserRepository({required DriftUserDao driftUserDao})
      : _driftUserDao = driftUserDao;

  @override
  Future<Result<void>> createUser({required AppModelUser user}) async {
    try {
      await _driftUserDao.insertUserByCompanion(toDriftCompanion(user));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateUserException());
    }
  }

  @override
  Future<Result<void>> deleteUserById({required int id}) async {
    try {
      await _driftUserDao.deleteUserById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteUserException());
    }
  }

  @override
  AppModelUser fromDriftDataClass(DataClass driftDataClass) {
    User user = driftDataClass as User;
    return AppModelUser(
      id: user.id,
      email: user.email,
      username: user.username,
      cloudDBSyncId: user.cloudDBSyncId,
    );
  }

  @override
  Future<Result<AppModelUser>> getUserById({required int id}) async {
    try {
      User? user = await _driftUserDao.getUserById(id);
      return (user == null)
          ? Result.error(UnableToFindUserException())
          : Result.ok(fromDriftDataClass(user));
    } on Exception {
      return Result.error(UnableToFindUserException());
    }
  }

  @override
  UsersCompanion toDriftCompanion(AppModel model) {
    AppModelUser user = model as AppModelUser;
    return UsersCompanion(
      id: (user.id == null) ? Value.absent() : Value(user.id!),
      cloudDBSyncId: Value(user.cloudDBSyncId),
      username: Value(user.username),
      email: Value(user.email),
    );
  }

  @override
  Future<Result<void>> updateUser({required AppModelUser user}) async {
    try {
      await _driftUserDao.updateUserByCompanion(toDriftCompanion(user));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateUserException());
    }
  }

  @override
  Future<Result<int>> getUserByCloudSyncId(
      {required String? cloudSyncId}) async {
    try {
      User? user = await _driftUserDao.getUserByCloudSyncId(cloudSyncId);
      return (user == null)
          ? Result.error(UnableToFindUserException())
          : Result.ok(user.id);
    } on Exception {
      return Result.error(UnableToFindUserException());
    }
  }
}
