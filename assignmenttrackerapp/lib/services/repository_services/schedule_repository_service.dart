import 'package:assignmenttrackerapp/common/exceptions/service_exceptions.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';

class ScheduleRepositoryService {
  final EventRepository _eventRepository;
  final TimeSlotRepository _timeSlotRepository;

  ScheduleRepositoryService({required EventRepository eventRepository, required TimeSlotRepository timeSlotRepository})
      : _eventRepository = eventRepository,
        _timeSlotRepository = timeSlotRepository;

  Future<Result<void>> processEvents({required List<AppModelEvent> events}) async {
    return Result.ok(null);
  }

  Future<Result<void>> processTimeSlots({required List<AppModelTimeSlot> timeSlots}) async {
    return Result.ok(null);
  }

  Future<Result<void>> deleteEventWithTimeslotCleanup({required int timeslotId, required int eventId}) async {
    Result eventDeleteResult = await _eventRepository.deleteEventById(id: eventId);

    if (eventDeleteResult is Error) {
      return Result.error(
        FailedServicingItemsException(
          location: 'ScheduleRepositoryService',
          failure: 'delete event with id: $eventId',
        ),
      );
    }

    return await _cleanUpTimeslot(timeslotId: timeslotId);
  }

  Future<Result<void>> _cleanUpTimeslot({required int timeslotId}) async {
    Result<Map<int, List<AppModelEvent>>> eventsForTimeslotResult = await _fetchEventsByTimeslotIds(timeslotIds: [timeslotId]);

    if (eventsForTimeslotResult is Error) {
      return Result.error(
        FailedServicingItemsException(
          location: 'ScheduleRepositoryService',
          failure: 'clean up timeslot with id: $timeslotId',
        ),
      );
    }

    Map<int, List<AppModelEvent>> eventsForTimeslot = (eventsForTimeslotResult as Ok).value;

    if ((eventsForTimeslot[timeslotId] ?? []).isEmpty) {
      return await _timeSlotRepository.deleteTimeSlotById(id: timeslotId);
    }

    return Result.ok(null);
  }

  Future<Result<Map<AppModelTimeSlot, List<AppModelEvent>>>> fetchAllEventsAndTimesBefore({required int userId, required DateTime upperBound}) async {
    DateTime date = _normalizedDate(date: upperBound);

    Result<List<AppModelTimeSlot>> timeslotsResult = await _fetchTimeslotsBefore(userId: userId, date: date);

    if (timeslotsResult is Error) {
      return Result.error(
        FailedServicingItemsException(
          location: 'ScheduleRepositoryService',
          failure: 'Timeslots before ${date.toString()} userId: $userId',
        ),
      );
    }

    List<AppModelTimeSlot> timeslots = (timeslotsResult as Ok).value;

    List<int> timeslotIds = timeslots.map((timeslot) => timeslot.id!).toList();
    Result<Map<int, List<AppModelEvent>>> eventsMapResult = await _fetchEventsByTimeslotIds(timeslotIds: timeslotIds);

    if (eventsMapResult is Error) {
      return Result.error(
        FailedServicingItemsException(
          location: 'ScheduleRepositoryService',
          failure: 'Events from ids: ${timeslotIds.toString()}',
        ),
      );
    }

    Map<int, List<AppModelEvent>> idToEventsMap = (eventsMapResult as Ok).value;

    return _combineTimeslotsAndEventMap(
      timeslots: timeslots,
      eventMap: idToEventsMap,
    );
  }

  DateTime _normalizedDate({required DateTime date}) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  Future<Result<List<AppModelTimeSlot>>> _fetchTimeslotsBefore({required int userId, required DateTime date}) async {
    return await _timeSlotRepository.getAllTimeslotsBefore(userId: userId, date: date);
  }

  Future<Result<Map<int, List<AppModelEvent>>>> _fetchEventsByTimeslotIds({required List<int> timeslotIds}) async {
    return await _eventRepository.getAllEventsByTimeslotIds(timeslotIds: timeslotIds);
  }

  Future<Result<Map<AppModelTimeSlot, List<AppModelEvent>>>> _combineTimeslotsAndEventMap({required List<AppModelTimeSlot> timeslots, required Map<int, List<AppModelEvent>> eventMap}) async {
    Map<AppModelTimeSlot, List<AppModelEvent>> result = {};

    for (AppModelTimeSlot timeslot in timeslots) {
      result[timeslot] = eventMap[timeslot.id!] ?? [];
    }

    return Result.ok(result);
  }
}
