import 'package:assignmenttrackerapp/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';

class DatabaseEvent extends DatabaseObject implements Datastreamable {
  final int _userId;
  final String _eventName;
  final List<DatabaseTimeSlot> _timeSlots;

  DatabaseEvent(
      {required super.id,
      required userId,
      required String eventName,
      required List<DatabaseTimeSlot> timeSlots})
      : _userId = userId,
        _eventName = eventName,
        _timeSlots = timeSlots;

  String get eventName => _eventName;
  List<DatabaseTimeSlot> get timeSlots => _timeSlots;
  int get userId => _userId;

  @override
  int get ownerId => _userId;
}
