import 'package:assignmenttrackerapp/common/exceptions/service_exceptions.dart';
import 'package:assignmenttrackerapp/common/utils/consume_result.dart';
import 'package:assignmenttrackerapp/common/utils/pair.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';

class ScheduleRepositoryService {
  final EventRepository _eventRepository;
  final TimeSlotRepository _timeSlotRepository;

  ScheduleRepositoryService(
      {required EventRepository eventRepository,
      required TimeSlotRepository timeSlotRepository})
      : _eventRepository = eventRepository,
        _timeSlotRepository = timeSlotRepository;

  Future<void> processEvents({required List<AppModelEvent> events}) async {}
  Future<void> processTimeSlots(
      {required List<AppModelTimeSlot> timeSlots}) async {}

  Future<void> deleteEventWithTimeslotCleanup(
      {required int timeslotId, required int eventId}) async {
    Result eventDeleteResult =
        await _eventRepository.deleteEventById(id: eventId);

    extractOrThrow(
        result: eventDeleteResult,
        throwIfFail: FailedServicingItemsException(
          location: 'ScheduleRepositoryService',
          failure: 'delete event with id: $eventId',
        ));

    await _cleanUpTimeslot(timeslotId: timeslotId);
  }

  Future<void> _cleanUpTimeslot({required int timeslotId}) async {
    Map<int, List<AppModelEvent>> eventsForTimeslot =
        await _fetchEventsByTimeslotIds(timeslotIds: [timeslotId]);

    if ((eventsForTimeslot[timeslotId] ?? []).isEmpty) {
      Result deleteTimeslotResult =
          await _timeSlotRepository.deleteTimeSlotById(id: timeslotId);

      extractOrThrow(
        result: deleteTimeslotResult,
        throwIfFail: FailedServicingItemsException(
            location: 'ScheduleRepositoryService',
            failure: 'cleanup timeslot with id: $timeslotId'),
      );
    }
  }

  Future<Map<AppModelTimeSlot, List<AppModelEvent>>>
      fetchAllEventsAndTimesBefore(
          {required int userId, required DateTime upperBound}) async {
    DateTime date = _normalizedDate(date: upperBound);

    List<AppModelTimeSlot> timeslots =
        await _fetchTimeslotsBefore(userId: userId, date: date);

    Map<int, List<AppModelEvent>> idToEventsMap =
        await _fetchEventsByTimeslotIds(
      timeslotIds: timeslots.map((timeslot) => timeslot.id!).toList(),
    );

    return _combineTimeslotsAndEventMap(
      timeslots: timeslots,
      eventMap: idToEventsMap,
    );
  }

  DateTime _normalizedDate({required DateTime date}) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  Future<List<AppModelTimeSlot>> _fetchTimeslotsBefore(
      {required int userId, required DateTime date}) async {
    Result timeslotsResult = await _timeSlotRepository.getAllTimeslotsBefore(
        userId: userId, date: date);

    return extractOrThrow(
      result: timeslotsResult,
      throwIfFail: FailedServicingItemsException(
        location: "ScheduleRepositoryService",
        failure: "Timeslots before ${date.toString()} userId: $userId",
      ),
    );
  }

  Future<Map<int, List<AppModelEvent>>> _fetchEventsByTimeslotIds(
      {required List<int> timeslotIds}) async {
    Result eventsResult = await _eventRepository.getAllEventsByTimeslotIds(
        timeslotIds: timeslotIds);

    return extractOrThrow(
      result: eventsResult,
      throwIfFail: FailedServicingItemsException(
        location: "ScheduleRepositoryService",
        failure: "Events from ids: ${timeslotIds.toString()}",
      ),
    );
  }

  Future<Map<AppModelTimeSlot, List<AppModelEvent>>>
      _combineTimeslotsAndEventMap(
          {required List<AppModelTimeSlot> timeslots,
          required Map<int, List<AppModelEvent>> eventMap}) async {
    Map<AppModelTimeSlot, List<AppModelEvent>> result = {};

    for (AppModelTimeSlot timeslot in timeslots) {
      result[timeslot] = eventMap[timeslot.id!] ?? [];
    }

    return result;
  }
}
