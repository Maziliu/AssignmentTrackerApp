import 'package:assignmenttrackerapp/models/datastream_object.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/utils/schedule_helpers.dart';

class DatabaseCourse extends DatabaseObject implements DatastreamObject {
  final int _profileId, _scheduleBitMask;
  final DatabaseGradedComponent _gradedComponent;
  final DatabaseGradeScale _gradeScale;
  final String _courseName, _courseCode;
  final DatabaseTimeSlot _timeSlot;
  final List<DatabaseEvent> _additionalCourseEvents;

  DatabaseCourse(
      {required super.id,
      required int profileId,
      required int scheduleBitMask,
      required DatabaseGradedComponent gradedComponent,
      required DatabaseGradeScale gradeScale,
      required String courseName,
      required String courseCode,
      required DatabaseTimeSlot timeSlot,
      required List<DatabaseEvent> additionalCourseEvents})
      : _profileId = profileId,
        _scheduleBitMask = scheduleBitMask,
        _gradedComponent = gradedComponent,
        _gradeScale = gradeScale,
        _courseName = courseName,
        _courseCode = courseCode,
        _timeSlot = timeSlot,
        _additionalCourseEvents = additionalCourseEvents;

  DatabaseCourse.fromRow(Map<String, Object?> row)
      : _profileId = row['profile_id'] as int,
        _scheduleBitMask = row['schedule_bitmask'] as int,
        _gradedComponent = row['graded_component'] as DatabaseGradedComponent,
        _gradeScale = row['grade_scale'] as DatabaseGradeScale,
        _courseName = row['course_name'] as String,
        _courseCode = row['course_code'] as String,
        _timeSlot = row['time_slot'] as DatabaseTimeSlot,
        _additionalCourseEvents =
            row['additional_course_events'] as List<DatabaseEvent>,
        super(id: row['id'] as int);

  List<bool> get scheduledDays => decodeScheduledDaysArray(_scheduleBitMask);
  DatabaseGradedComponent get gradedComponent => _gradedComponent;
  DatabaseGradeScale get gradeScale => _gradeScale;
  String get courseName => _courseName;
  String get courseCode => _courseCode;
  DatabaseTimeSlot get timeSlot => _timeSlot;
  List<DatabaseEvent> get additionalCourseEvents => _additionalCourseEvents;

  @override
  String toString() => courseCode;

  @override
  int get profileId => _profileId;
}
