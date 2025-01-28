import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/user_table.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/user_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';
part 'drift_users_dao.g.dart';

@DriftAccessor(tables: [Users])
class DriftUsersDAO extends DatabaseAccessor<AppDatabase>
    with _$DriftUsersDAOMixin
    implements UserRepository {
  DriftUsersDAO(super.database);

  @override
  Future<Result<void>> deleteUserById({required int id}) async {
    try {
      await (delete(db.users)..where((user) => user.id.equals(id))).go();
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteUserException());
    }
  }

  @override
  Future<Result<DatabaseUser>> findUserById({required int id}) async {
    try {
      final user = await (select(db.users)..where((user) => user.id.equals(id)))
          .getSingleOrNull();

      if (user == null) {
        return Result.error(UnableToFindUserException());
      }

      return Result.ok(_fromUser(user));
    } on Exception {
      return Result.error(UnableToFindUserException());
    }
  }

  @override
  Future<Result<void>> insertUser(
      {required Map<String, Object?> values}) async {
    try {
      final companion = _createCompanion(values: values);

      await into(db.users).insert(companion);

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToInsertUserException());
    }
  }

  @override
  Future<Result<DatabaseUser>> updateUserById(
      {required int id, required Map<String, Object?> updatedValues}) async {
    try {
      final companion = _createCompanion(values: updatedValues, id: id);

      await db.update(db.users).write(companion);

      return findUserById(id: id);
    } on Exception {
      return Result.error(UnableToUpdateUserException());
    }
  }

  UsersCompanion _createCompanion(
      {int? id, required Map<String, Object?> values}) {
    return UsersCompanion(
      id: (id == null) ? Value.absent() : Value(id),
      username: values['username'] as Value<String>,
      email: values['email'] as Value<String>,
    );
  }

  DatabaseUser _fromUser(User user) {
    return DatabaseUser(
      id: user.id,
      email: user.email,
      username: user.username,
    );
  }
}
