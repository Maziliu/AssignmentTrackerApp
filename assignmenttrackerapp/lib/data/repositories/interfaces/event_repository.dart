import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';

abstract class EventRepository {
  Future<Result<AppModelEvent>> getEventById({required int id});
  Future<Result<void>> createEvent({required AppModelEvent event});
  Future<Result<void>> updateEvent({required AppModelEvent event});
  Future<Result<void>> deleteEventById({required int id});
  Future<Result<List<AppModelEvent>>> getAllEventsByUserId(
      {required int userId});
  Future<Result<List<AppModelEvent>>> getAllEventsTodayByUserId(
      {required int userId});
  Future<Result<List<AppModelEvent>>> getAllEventsForNext14DaysByUserId(
      {required int userId});
  Future<Result<Map<int, List<AppModelEvent>>>> getAllEventsByTimeslotIds(
      {required List<int> timeslotIds});
}
