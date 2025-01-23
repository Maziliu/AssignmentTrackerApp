import 'package:assignmenttrackerapp/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';

class DatabaseEvent extends DatabaseObject implements Datastreamable{
  final int _userId;
  final String _eventName;
  final List<DatabaseTimeSlot> _timeSlot;

  DatabaseEvent(
      {required super.id,
      required userId,
      required String eventName,
      required List<DatabaseTimeSlot> timeSlot})
      : _userId = userId,
        _eventName = eventName,
        _timeSlot = timeSlot;

  DatabaseEvent.fromRow(Map<String, Object?> row)
      : _userId =  row['user_id'] as int,
        _eventName = row['event_name'] as String,
        _timeSlot = row['time_slots'] as List<DatabaseTimeSlot>,
        super(id: row['id'] as int);

  String get eventName => _eventName;
  List<DatabaseTimeSlot> get timeSlot => _timeSlot;
  int get userId => _userId;
  
  @override
  int get ownerId => _userId;
}
