import 'package:assignmenttrackerapp/models/db_time_slot.dart';

abstract class TimeSlotRepository {
  Future<DatabaseTimeSlot> findTimeSlotById({required int id});
  Future<List<DatabaseTimeSlot>> findTimeSlotsByReferenceId(
      {required int referenceId});
  Future<DatabaseTimeSlot> updateTimeSlotById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<void> deleteTimeSlotById({required int id});
  Future<void> insertTimeSlot({required Map<String, Object?> values});
}
