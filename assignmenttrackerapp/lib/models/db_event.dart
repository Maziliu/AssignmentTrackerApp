import 'package:assignmenttrackerapp/models/datastream_object.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';

class DatabaseEvent extends DatabaseObject implements DatastreamObject {
  final int _profileId;
  final String _eventName;
  final DatabaseTimeSlot _timeSlot;

  DatabaseEvent(
      {required super.id,
      required int profileId,
      required String eventName,
      required DatabaseTimeSlot timeSlot})
      : _profileId = profileId,
        _eventName = eventName,
        _timeSlot = timeSlot;

  String get eventName => _eventName;
  DatabaseTimeSlot get timeSlot => _timeSlot;

  @override
  int get profileId => _profileId;
}
