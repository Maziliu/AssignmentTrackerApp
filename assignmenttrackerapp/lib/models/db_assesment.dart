import 'package:assignmenttrackerapp/enums/assessment_type.dart';
import 'package:assignmenttrackerapp/models/datastream_object.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';

class DatabaseAssesment extends DatabaseObject implements DatastreamObject {
  final int _courseId, _profileId;
  final DatabaseGradedComponent _gradedComponent;
  final String _assesmentName;
  final AssessmentType _type;
  final bool _isComplete;
  final DatabaseTimeSlot _timeSlot;

  DatabaseAssesment(
      {required super.id,
      required int courseId,
      required int profileId,
      required DatabaseGradedComponent gradedComponent,
      required String assesmentName,
      required AssessmentType type,
      required bool isComplete,
      required DatabaseTimeSlot timeSlot})
      : _courseId = courseId,
        _profileId = profileId,
        _gradedComponent = gradedComponent,
        _assesmentName = assesmentName,
        _type = type,
        _isComplete = isComplete,
        _timeSlot = timeSlot;

  DatabaseAssesment.fromRow(Map<String, Object?> row)
      : _profileId = row['profile_id'] as int,
        _courseId = row['course_id'] as int,
        _gradedComponent = row['graded_component'] as DatabaseGradedComponent,
        _assesmentName = row['assesment_name'] as String,
        _type = AssessmentType.values.byName(row['type'] as String),
        _isComplete = row['is_complete'] as bool,
        _timeSlot = row['time_slot'] as DatabaseTimeSlot,
        super(id: row['id'] as int);

  int get courseId => _courseId;
  DatabaseGradedComponent get gradedComponent => _gradedComponent;
  String get assesmentName => _assesmentName;
  AssessmentType get type => _type;
  bool get isComplete => _isComplete;
  DatabaseTimeSlot get timeSlot => _timeSlot;

  @override
  int get profileId => _profileId;
}
