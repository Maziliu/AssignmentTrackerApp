import 'package:assignmenttrackerapp/models/db_profile.dart';

abstract class ProfileRepository {
  Future<DatabaseProfile> findProfileById({required int id});
  Future<DatabaseProfile> updateProfileById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<void> deleteProfileById({required int id});
  Future<void> insertProfile({required Map<String, Object?> values});
}