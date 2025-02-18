import 'package:assignmenttrackerapp/data/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';

class AppModelCourse extends AppModel implements Datastreamable {
  final String _courseName, _courseCode;
  final int _scheduleBitMask, _gradedComponentId, _gradeScaleId, _eventId, _userId;

  AppModelCourse(
      {required super.id,
      required String courseName,
      required String courseCode,
      required int scheduleBitMask,
      required int gradedComponentId,
      required int gradeScaleId,
      required int eventId,
      required int userId})
      : _courseName = courseName,
        _courseCode = courseCode,
        _scheduleBitMask = scheduleBitMask,
        _gradedComponentId = gradedComponentId,
        _gradeScaleId = gradeScaleId,
        _eventId = eventId,
        _userId = userId;

  String get courseName => _courseName;
  String get courseCode => _courseCode;
  int get scheduleBitMask => _scheduleBitMask;
  int get gradedComponentId => _gradedComponentId;
  int get gradeScaleId => _gradeScaleId;
  int get eventId => _eventId;

  @override
  int get ownerId => _userId;
}
