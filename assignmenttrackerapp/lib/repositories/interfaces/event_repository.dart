import 'package:assignmenttrackerapp/models/db_event.dart';

abstract class EventRepository {
  Future<DatabaseEvent> findEventById({required int id});
  Future<DatabaseEvent> updateEventById(
      {required int eventId,
      int? timeSlotId,
      Map<String, Object?>? updatedEventValues,
      Map<String, Object?>? updatedTimeSlotValues});
  Future<void> deleteEventById({required int id});
  Future<void> insertEvent(
      {required Map<String, Object?> eventValues,
      required Map<String, Object?> timeSlotValues});
}
