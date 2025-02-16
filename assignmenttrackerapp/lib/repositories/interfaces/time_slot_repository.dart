import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class TimeSlotRepository {
  Future<Result<DatabaseTimeSlot>> getTimeSlotById({required int id});
  Future<Result<void>> createTimeSlot({required DatabaseTimeSlot timeSlot});
  Future<Result<void>> updateTimeSlot({required DatabaseTimeSlot timeSlot});
  Future<Result<void>> deleteTimeSlotById({required int id});
}
