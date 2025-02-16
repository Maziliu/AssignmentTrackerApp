import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/tables/user_table.dart';
import 'package:drift/drift.dart';

part 'drift_user_dao.g.dart';

@DriftAccessor(tables: [Users])
class DriftUserDao extends DatabaseAccessor<AppDatabase>
    with _$DriftUserDaoMixin {
  DriftUserDao(super.attachedDatabase);

  Future<List<User>> getAllLocalUsers() => (select(users)).get();

  Future<User?> getUserById(int userId) =>
      (select(users)..where((user) => user.id.equals(userId)))
          .getSingleOrNull();

  Future<int> deleteUserById(int userId) =>
      (delete(users)..where((user) => user.id.equals(userId))).go();

  Future<int> insertUserByCompanion(UsersCompanion companion) =>
      into(users).insert(companion);

  Future<bool> updateUserByCompanion(UsersCompanion companion) =>
      update(users).replace(companion);
}
