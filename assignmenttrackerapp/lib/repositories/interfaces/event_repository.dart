import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/utils/result.dart';

abstract class EventRepository {
  Future<Result<DatabaseEvent>> getEventById({required int id});
  Future<Result<void>> createEvent({required DatabaseEvent event});
  Future<Result<void>> updateEvent({required DatabaseEvent event});
  Future<Result<void>> deleteEventById({required int id});
}
