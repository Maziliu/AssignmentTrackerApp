import 'package:assignmenttrackerapp/data/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';

class AppModelEvent extends AppModel implements Datastreamable {
  final String _eventName;
  final int _timeSlotId, _userId;

  AppModelEvent(
      {required super.id,
      required String eventName,
      required int timeSlotId,
      required int userId})
      : _eventName = eventName,
        _timeSlotId = timeSlotId,
        _userId = userId;

  String get eventName => _eventName;
  int get timeSlotId => _timeSlotId;

  @override
  int get ownerId => _userId;

  @override
  String toString() {
    return _eventName;
  }
}
