import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/services/repository_services/schedule_repository_service.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';

class ScheduleViewModel extends ChangeNotifier {
  final ScheduleRepositoryService _scheduleRepositoryService;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Map<AppModelTimeSlot, List<AppModelEvent>> _timeToEventMap = {};
  Map<AppModelTimeSlot, List<AppModelEvent>> get timeToEventMap => _timeToEventMap;

  ScheduleViewModel({required ScheduleRepositoryService scheduleRepositoryService, required userId}) : _scheduleRepositoryService = scheduleRepositoryService {
    if (userId != null) {
      loadEvents(userId);
    }
  }

  Future<void> loadEvents(int userId) async {
    _isLoading = true;
    notifyListeners();

    DateTime now = DateTime.now();

    Result result = await _scheduleRepositoryService.fetchAllEventsAndTimesBefore(userId: userId, upperBound: DateTime(now.year, now.month, now.day + 14));

    switch (result) {
      case Ok():
        _timeToEventMap = result.value;
      case Error():
        showErrorMessage(result.error.toString());
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateEvent(int id) async {}

  Future<void> deleteEvent({required int timeslotId, required int eventId}) async {
    Result result = await _scheduleRepositoryService.deleteEventWithTimeslotCleanup(eventId: eventId, timeslotId: timeslotId);

    switch (result) {
      case Ok():
        _timeToEventMap.forEach((timeslotKey, eventList) {
          eventList.removeWhere((event) => event.id! == eventId);
        });

        _timeToEventMap.removeWhere((timeslotKey, eventList) => eventList.isEmpty);

        notifyListeners();
      case Error():
        showErrorMessage(result.error.toString());
    }
  }
}
