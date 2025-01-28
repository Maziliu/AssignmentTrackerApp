import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/enums/user_type.dart';
import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';

class DatabaseUser extends DatabaseObject {
  final String? _email;
  final String _username;

  DatabaseUser(
      {required super.id, required String? email, required String username})
      : _email = email,
        _username = username;

  String get email => _email!;
  String get username => _username;

  @override
  String toString() {
    return 'ID: $id, EMAIL: $_email';
  }
}
