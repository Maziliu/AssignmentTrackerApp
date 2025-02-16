import 'package:assignmenttrackerapp/models/app_model_event.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class EventRepository {
  Future<Result<AppModelEvent>> getEventById({required int id});
  Future<Result<void>> createEvent({required AppModelEvent event});
  Future<Result<void>> updateEvent({required AppModelEvent event});
  Future<Result<void>> deleteEventById({required int id});
}
