import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseCourse implements DatabaseObject {
  final int _id, _userId;
  final String _courseName;
  late final DatabaseEvent? _courseEvent, _tutorialEvent, _labEvent;

  DatabaseCourse({
    required int id,
    required int userId,
    required String courseName,
    required DatabaseEvent courseEvent,
    required DatabaseEvent tutorialEvent,
    required DatabaseEvent labEvent,
  })  : _id = id,
        _userId = userId,
        _courseName = courseName,
        _courseEvent = courseEvent,
        _tutorialEvent = tutorialEvent,
        _labEvent = labEvent;

  DatabaseCourse.fromRow(Map<String, Object?> row)
      : _id = row['id'] as int,
        _userId = row['user_id'] as int,
        _courseName = row['course_name'] as String;

  DatabaseEvent? get courseEvent => _courseEvent;
  DatabaseEvent? get tutorialEvent => _tutorialEvent;
  DatabaseEvent? get labEvent => _labEvent;

  int get courseId => _id;
  String get courseName => _courseName;

  set courseEvent(val) {
    _courseEvent = val;
  }

  set tutorialEvent(val) {
    _tutorialEvent = val;
  }

  set labEvent(val) {
    _labEvent = val;
  }

  @override
  String toString() {
    return 'ID: $_id, Course: $_courseName';
  }

  @override
  bool operator ==(covariant DatabaseObject other) {
    if (other is DatabaseCourse) {
      return _id == other._id;
    }

    return false;
  }

  @override
  int get hashCode {
    return _id.hashCode;
  }

  @override
  int get ownerId => _userId;
}
