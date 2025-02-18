import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/services/repository_services/schedule_repository_service.dart';
import 'package:get_it/get_it.dart';

void setUpServiceDependencies({required GetIt injector}) {
  injector.registerLazySingleton<ScheduleRepositoryService>(
    () => ScheduleRepositoryService(
      eventRepository: injector<EventRepository>(),
      timeSlotRepository: injector<TimeSlotRepository>(),
    ),
  );
}
