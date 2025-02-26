import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_event_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/common/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_timeslot_dao.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:drift/drift.dart';

class DriftEventRepository implements EventRepository, DriftRepository {
  final DriftEventDao _driftEventDao;
  final DriftTimeslotDao _driftTimeslotDao;

  DriftEventRepository({required DriftEventDao driftEventDao, required DriftTimeslotDao driftTimeslotDao})
      : _driftEventDao = driftEventDao,
        _driftTimeslotDao = driftTimeslotDao;

  @override
  Future<Result<void>> createEvent({required AppModelEvent event}) async {
    try {
      await _driftEventDao.insertEventByCompanion(toDriftCompanion(event));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateEventException());
    }
  }

  @override
  Future<Result<void>> deleteEventById({required int id}) async {
    try {
      await _driftEventDao.deleteEventById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteEventException());
    }
  }

  @override
  AppModelEvent fromDriftDataClass(DataClass driftDataClass) {
    Event event = driftDataClass as Event;
    return AppModelEvent(
      id: event.id,
      userId: event.userId,
      eventName: event.eventName,
      timeSlotId: event.timeslotId,
    );
  }

  @override
  Future<Result<AppModelEvent>> getEventById({required int id}) async {
    try {
      Event? event = await _driftEventDao.getEventById(id);
      return (event == null) ? Result.error(FailedToRetrieveEventException()) : Result.ok(fromDriftDataClass(event));
    } on Exception {
      return Result.error(FailedToRetrieveEventException());
    }
  }

  @override
  EventsCompanion toDriftCompanion(AppModel model) {
    AppModelEvent event = model as AppModelEvent;
    return EventsCompanion(
      id: (event.id == null) ? Value.absent() : Value(event.id!),
      userId: Value(event.ownerId),
      timeslotId: Value(event.timeSlotId),
      eventName: Value(event.eventName),
    );
  }

  @override
  Future<Result<void>> updateEvent({required AppModelEvent event}) async {
    try {
      await _driftEventDao.updateEventByCompanion(toDriftCompanion(event));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateEventException());
    }
  }

  @override
  Future<Result<List<AppModelEvent>>> getAllEventsByUserId({required int userId}) async {
    try {
      List<Event> events = await _driftEventDao.getAllEvents(userId: userId);
      return Result.ok(events.map((event) => fromDriftDataClass(event)).toList());
    } on Exception {
      return Result.error(FailedToRetrieveEventException());
    }
  }

  @override
  Future<Result<List<AppModelEvent>>> getAllEventsForNext14DaysByUserId({required int userId}) async {
    try {
      DateTime now = DateTime.now();

      List<Timeslot> timeslots =
          await _driftTimeslotDao.getAllTimeslotsBefore(userId: userId, date: DateTime(now.year, now.month, now.day + 14, 23, 59, 59, 999));

      List<Event> events =
          (await Future.wait(timeslots.map((timeslot) async => await _driftEventDao.getEventsByTimeslotId(timeslot.id)))).expand((event) => event).toList();

      return Result.ok(events.map((event) => fromDriftDataClass(event)).toList());
    } on Exception {
      return Result.error(FailedToRetrieveEventException());
    }
  }

  @override
  Future<Result<List<AppModelEvent>>> getAllEventsTodayByUserId({required int userId}) async {
    try {
      DateTime now = DateTime.now();

      List<Timeslot> timeslots = await _driftTimeslotDao.getAllTimeslotsBefore(userId: userId, date: DateTime(now.year, now.month, now.day, 23, 59, 59, 999));

      List<Event> events =
          (await Future.wait(timeslots.map((timeslot) async => await _driftEventDao.getEventsByTimeslotId(timeslot.id)))).expand((event) => event).toList();

      return Result.ok(events.map((event) => fromDriftDataClass(event)).toList());
    } on Exception {
      return Result.error(FailedToRetrieveEventException());
    }
  }

  @override
  Future<Result<Map<int, List<AppModelEvent>>>> getAllEventsByTimeslotIds({required List<int> timeslotIds}) async {
    try {
      Map<int, List<AppModelEvent>> result = {};

      for (int id in timeslotIds) {
        List<Event> events = await _driftEventDao.getEventsByTimeslotId(id);
        result[id] = events.map((event) => fromDriftDataClass(event)).toList();
      }

      return Result.ok(result);
    } on Exception {
      return Result.error(FailedToRetrieveTimeSlotException());
    }
  }
}
