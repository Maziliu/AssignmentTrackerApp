import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseProfile extends DatabaseObject {
  final String _profileName;
  final int? _userId;

  DatabaseProfile(
      {required super.id, required String profileName, required int? userId})
      : _profileName = profileName,
        _userId = userId;

  String get profileName => _profileName;
  int get user => _userId!;

  bool syncedWithUser() => _userId != null;
}
