import 'package:assignmenttrackerapp/database/DAOs/drift/drift_event_dao.dart';
import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/models/app_model_event.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/drift_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

class DriftEventRepository implements EventRepository, DriftRepository {
  final DriftEventDao _driftEventDao;

  DriftEventRepository({required DriftEventDao driftEventDao})
      : _driftEventDao = driftEventDao;

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
      return (event == null)
          ? Result.error(UnableToFindEventException())
          : Result.ok(fromDriftDataClass(event));
    } on Exception {
      return Result.error(UnableToFindEventException());
    }
  }

  @override
  EventsCompanion toDriftCompanion(AppModel model) {
    AppModelEvent event = model as AppModelEvent;
    return EventsCompanion(
      id: Value(event.id),
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
}
