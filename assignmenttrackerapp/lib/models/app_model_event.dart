import 'package:assignmenttrackerapp/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/models/app_model_time_slot.dart';

class AppModelEvent extends AppModel implements Datastreamable {
  final String _userId, _eventName;
  final int _timeSlotId;

  AppModelEvent(
      {required super.id,
      required String userId,
      required String eventName,
      required int timeSlotId})
      : _userId = userId,
        _eventName = eventName,
        _timeSlotId = timeSlotId;

  String get eventName => _eventName;
  int get timeSlotId => _timeSlotId;

  @override
  String get ownerId => _userId;
}
