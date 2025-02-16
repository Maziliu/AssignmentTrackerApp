import 'package:assignmenttrackerapp/database/DAOs/drift/drift_user_dao.dart';
import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';
import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/drift_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/user_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

class DriftUserRepository implements UserRepository, DriftRepository {
  final DriftUserDao _driftUserDao;

  DriftUserRepository({required DriftUserDao driftUserDao})
      : _driftUserDao = driftUserDao;

  @override
  Future<Result<void>> createUser({required DatabaseUser user}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteUserById({required int id}) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  DatabaseObject fromDriftDataClass(DataClass driftDataClass) {
    // TODO: implement fromDriftDataClass
    throw UnimplementedError();
  }

  @override
  Future<Result<DatabaseUser>> getUserById({required int id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  UpdateCompanion toDriftCompanion(DatabaseObject driftCompanion) {
    // TODO: implement toDriftCompanion
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateUser({required DatabaseUser user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
