import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class TimeSlotRepository {
  Future<Result<DatabaseTimeSlot>> findTimeSlotById({required int id});
  Future<Result<List<DatabaseTimeSlot>>> findTimeSlotsByReferenceId(
      {required int referenceId});
  Future<Result<DatabaseTimeSlot>> updateTimeSlotById(
      {required int id, required Map<String, Object?> updatedValues});
  Future<Result<void>> deleteTimeSlotById({required int id});
  Future<Result<void>> insertTimeSlot({required Map<String, Object?> values});
}
