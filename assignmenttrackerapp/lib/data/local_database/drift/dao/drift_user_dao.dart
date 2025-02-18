import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:drift/drift.dart';

part 'drift_user_dao.g.dart';

@DriftAccessor(tables: [Users])
class DriftUserDao extends DatabaseAccessor<AppDatabase> with _$DriftUserDaoMixin {
  DriftUserDao(super.attachedDatabase);

  Future<List<User>> getAllLocalUsers() => (select(users)).get();

  Future<User?> getUserById(int userId) => (select(users)..where((user) => user.id.equals(userId))).getSingleOrNull();

  Future<int> deleteUserById(int userId) => (delete(users)..where((user) => user.id.equals(userId))).go();

  Future<int> insertUserByCompanion(UsersCompanion companion) => into(users).insert(companion);

  Future<bool> updateUserByCompanion(UsersCompanion companion) => update(users).replace(companion);

  Future<User?> getUserByCloudSyncId(String? cloudSyncId) async {
    if (cloudSyncId == null) return null;

    return await (select(users)..where((user) => user.cloudDBSyncId.equals(cloudSyncId))).getSingleOrNull();
  }
}
