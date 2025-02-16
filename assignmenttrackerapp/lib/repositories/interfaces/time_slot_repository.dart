import 'package:assignmenttrackerapp/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class TimeSlotRepository {
  Future<Result<AppModelTimeSlot>> getTimeSlotById({required int id});
  Future<Result<void>> createTimeSlot({required AppModelTimeSlot timeSlot});
  Future<Result<void>> updateTimeSlot({required AppModelTimeSlot timeSlot});
  Future<Result<void>> deleteTimeSlotById({required int id});
}
