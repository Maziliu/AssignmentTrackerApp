import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/enums/assessment_type.dart';
import 'package:assignmenttrackerapp/models/app_model_event.dart';
import 'package:assignmenttrackerapp/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/models/app_model_graded_component.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/models/app_model_time_slot.dart';

class AppModelAssessment extends AppModel implements Datastreamable {
  final String _userId, _assessmentName;
  final AssessmentType _assessmentType;
  final bool _isComplete;
  final int _gradedComponentId, _eventId;

  AppModelAssessment(
      {required super.id,
      required String userId,
      required String assessmentName,
      required AssessmentType assessmentType,
      required bool isComplete,
      required int gradedComponentId,
      required int eventId})
      : _userId = userId,
        _assessmentName = assessmentName,
        _assessmentType = assessmentType,
        _isComplete = isComplete,
        _gradedComponentId = gradedComponentId,
        _eventId = eventId;

  String get assessmentName => _assessmentName;
  AssessmentType get assessmentType => _assessmentType;
  bool get isComplete => _isComplete;
  int get gradedComponentId => _gradedComponentId;
  int get eventId => _eventId;

  @override
  String get ownerId => _userId;
}
