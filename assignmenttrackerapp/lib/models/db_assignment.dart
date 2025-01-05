import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseAssignment implements DatabaseObject {
  final int _id, _userId;
  final DateTime _creationDate, _dueDate;
  final String _title, _course;

  DatabaseAssignment(
      {required int id,
      required int userId,
      required DateTime creationDate,
      required DateTime dueDate,
      required String title,
      required String course})
      : _course = course,
        _title = title,
        _dueDate = dueDate,
        _creationDate = creationDate,
        _userId = userId,
        _id = id;

  DatabaseAssignment.fromRow(Map<String, Object?> row)
      : _id = row['id'] as int,
        _userId = row['user_id'] as int,
        _creationDate =
            DateTime.fromMillisecondsSinceEpoch(row['creation_date'] as int),
        _dueDate = DateTime.fromMillisecondsSinceEpoch(row['due_date'] as int),
        _title = row['title'] as String,
        _course = row['course'] as String;

  int get id => _id;
  int get userId => _userId;
  DateTime get creationDate => _creationDate;
  DateTime get dueDate => _dueDate;
  String get title => _title;
  String get course => _course;

  @override
  bool operator ==(covariant DatabaseObject other) {
    if (other is DatabaseAssignment) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ID: $_id USERID: $_userId';
  }

  @override
  int get ownerId => _userId;
}
