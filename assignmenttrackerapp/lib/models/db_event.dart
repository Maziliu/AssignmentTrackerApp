import 'package:assignmenttrackerapp/models/datastream_object.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';

class DatabaseEvent extends DatabaseObject implements DatastreamObject {
  final int _profileId;
  final String _eventName;
  final List<DatabaseTimeSlot> _timeSlot;

  DatabaseEvent(
      {required super.id,
      required int profileId,
      required String eventName,
      required List<DatabaseTimeSlot> timeSlot})
      : _profileId = profileId,
        _eventName = eventName,
        _timeSlot = timeSlot;

  DatabaseEvent.fromRow(Map<String, Object?> row)
      : _profileId = row['profile_id'] as int,
        _eventName = row['event_name'] as String,
        _timeSlot = row['time_slots'] as List<DatabaseTimeSlot>,
        super(id: row['id'] as int);

  String get eventName => _eventName;
  List<DatabaseTimeSlot> get timeSlot => _timeSlot;

  @override
  int get profileId => _profileId;
}
