import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class EventRepository {
  Future<Result<DatabaseEvent>> findEventById({required int id});
  Future<Result<DatabaseEvent>> updateEventById(
      {required int eventId,
      required Map<String, Object?> updatedEventValues,
      int? timeSlotId,
      Map<String, Object?>? updatedTimeSlotValues});
  Future<Result<void>> deleteEventById({required int id});
  Future<Result<void>> insertEvent(
      {required Map<String, Object?> eventValues,
      required List<Map<String, Object?>> timeSlotValuesList});
}
