import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_timeslot_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/common/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:drift/drift.dart';

class DriftTimeslotRepository implements TimeSlotRepository, DriftRepository {
  final DriftTimeslotDao _driftTimeslotDao;

  DriftTimeslotRepository({required DriftTimeslotDao driftTimeslotDao}) : _driftTimeslotDao = driftTimeslotDao;

  @override
  Future<Result<void>> createTimeSlot({required AppModelTimeSlot timeSlot}) async {
    try {
      await _driftTimeslotDao.insertTimeslotByCompanion(toDriftCompanion(timeSlot));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateTimeSlotException());
    }
  }

  @override
  Future<Result<void>> deleteTimeSlotById({required int id}) async {
    try {
      await _driftTimeslotDao.deleteTimeslotById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteTimeSlotException());
    }
  }

  @override
  AppModelTimeSlot fromDriftDataClass(DataClass driftDataClass) {
    Timeslot timeslot = driftDataClass as Timeslot;
    return AppModelTimeSlot(id: timeslot.id, userId: timeslot.userId, endingDay: timeslot.endingDay, startDate: timeslot.startDate, endDate: timeslot.endDate);
  }

  @override
  Future<Result<AppModelTimeSlot>> getTimeSlotById({required int id}) async {
    try {
      Timeslot? timeslot = await _driftTimeslotDao.getTimeslotById(id);
      return (timeslot == null) ? Result.error(FailedToRetrieveTimeSlotException()) : Result.ok(fromDriftDataClass(timeslot));
    } on Exception {
      return Result.error(FailedToRetrieveTimeSlotException());
    }
  }

  @override
  TimeslotsCompanion toDriftCompanion(AppModel model) {
    AppModelTimeSlot timeSlot = model as AppModelTimeSlot;
    return TimeslotsCompanion(
        id: (timeSlot.id == null) ? Value.absent() : Value(timeSlot.id!),
        userId: Value(timeSlot.ownerId),
        endingDay: Value(timeSlot.endingDayOfTheWeek),
        startDate: Value(timeSlot.startDate),
        endDate: Value(timeSlot.endDate));
  }

  @override
  Future<Result<void>> updateTimeSlot({required AppModelTimeSlot timeSlot}) async {
    try {
      await _driftTimeslotDao.updateTimeslotByCompanion(toDriftCompanion(timeSlot));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateTimeSlotException());
    }
  }

  @override
  Future<Result<List<AppModelTimeSlot>>> getAllTimeslotsBefore({required int userId, required DateTime date}) async {
    try {
      List<Timeslot> timeslots = await _driftTimeslotDao.getAllTimeslotsBefore(userId: userId, date: date);
      return Result.ok(timeslots.map((timeslot) => fromDriftDataClass(timeslot)).toList());
    } on Exception {
      return Result.error(FailedToRetrieveTimeSlotException());
    }
  }
}
