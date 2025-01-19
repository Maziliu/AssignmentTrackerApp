import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseUser extends DatabaseObject {
  final String _email;

  DatabaseUser({
    required super.id,
    required String email,
  }) : _email = email;

  DatabaseUser.fromRow(Map<String, Object?> row)
      : _email = row['email'] as String,
        super(id: row['id'] as int);

  String get email => _email;

  @override
  String toString() {
    return 'ID: $id, EMAIL: $_email';
  }
}
