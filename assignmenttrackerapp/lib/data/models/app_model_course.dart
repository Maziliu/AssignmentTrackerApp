import 'package:assignmenttrackerapp/data/models/app_model_assessment.dart';
import 'package:assignmenttrackerapp/data/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/data/models/app_model_grade_scale.dart';
import 'package:assignmenttrackerapp/data/models/app_model_graded_component.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/core/utils/schedule_helpers.dart';

class AppModelCourse extends AppModel implements Datastreamable {
  final String _userId, _courseName, _courseCode;
  final int _scheduleBitMask, _gradedComponentId, _gradeScaleId, _eventId;

  AppModelCourse(
      {required super.id,
      required String userId,
      required String courseName,
      required String courseCode,
      required int scheduleBitMask,
      required int gradedComponentId,
      required int gradeScaleId,
      required int eventId})
      : _userId = userId,
        _courseName = courseName,
        _courseCode = courseCode,
        _scheduleBitMask = scheduleBitMask,
        _gradedComponentId = gradedComponentId,
        _gradeScaleId = gradeScaleId,
        _eventId = eventId;

  String get userId => _userId;
  String get courseName => _courseName;
  String get courseCode => _courseCode;
  int get scheduleBitMask => _scheduleBitMask;
  int get gradedComponentId => _gradedComponentId;
  int get gradeScaleId => _gradeScaleId;
  int get eventId => _eventId;

  @override
  String get ownerId => _userId;
}
