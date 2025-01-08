import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseCourse implements DatabaseObject {
  final int _id, _userId;
  final String _courseName;
  final DatabaseEvent _courseEvent, _tutorialEvent, _labEvent;

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
        _userId = row['userId'] as int,
        _courseName = row['course_name'] as String,
        _courseEvent = DatabaseEvent.fromRow(
            row['course_time_slots'] as Map<String, Object?>),
        _tutorialEvent = DatabaseEvent.fromRow(
            row['tutorial_time_slots'] as Map<String, Object?>),
        _labEvent = DatabaseEvent.fromRow(
            row['lab_time_slots'] as Map<String, Object?>);

  DatabaseEvent get courseEvent => _courseEvent;
  DatabaseEvent get tutorialEvent => _tutorialEvent;
  DatabaseEvent get labEvent => _labEvent;

  int get courseId => _id;
  String get courseName => _courseName;

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
