import 'package:assignmenttrackerapp/enums/user_type.dart';
import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';

class DatabaseUser extends DatabaseObject {
  final String? _email;
  final UserType _userType;
  final String _username;

  DatabaseUser({required super.id, required String? email, required UserType userType, required String username}) : _email = email, _userType = userType, _username = username;

  DatabaseUser.fromRow(Map<String, Object?> row) 
  : _email = row['email'] as String?,
  _userType = UserType.values.byName(row['username'] as String),
  _username = row['username'] as String, 
  super(id: row['id'] as int);

  String get email => _email!;


  @override
  String toString() {
    return 'ID: $id, EMAIL: $_email';
  }
}
