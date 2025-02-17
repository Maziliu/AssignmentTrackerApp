import 'package:assignmenttrackerapp/common/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';

class ScheduleViewModel extends ChangeNotifier {
  final EventRepository _eventRepository;
  final TimeSlotRepository _timeSlotRepository;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<AppModelEvent> _events = [];
  List<AppModelEvent> get events => _events;

  ScheduleViewModel({
    required EventRepository eventRepository,
    required TimeSlotRepository timeSlotRepository,
    required int? userId,
  })  : _eventRepository = eventRepository,
        _timeSlotRepository = timeSlotRepository {
    if (userId != null) {
      loadEvents(userId);
    }
  }

  Future<void> loadEvents(int userId) async {
    _isLoading = true;
    notifyListeners();

    final result = await _eventRepository.getAllEventsForNext14DaysByUserId(
        userId: userId);

    if (result is Ok<List<AppModelEvent>>) {
      _events = result.value;
    } else {
      _events = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateEvent() async {}

  Future<void> deleteEvent() async {}

  Future<void> addSampleEvents(int userId) async {
    _isLoading = true;
    notifyListeners();

    // 🔹 Create events and time slots
    final List<AppModelEvent> sampleEvents = [
      AppModelEvent(
          id: null, eventName: "Math Exam", timeSlotId: 1, userId: userId),
      AppModelEvent(
          id: null,
          eventName: "Project Deadline",
          timeSlotId: 2,
          userId: userId),
      AppModelEvent(
          id: null, eventName: "Team Meeting", timeSlotId: 3, userId: userId),
    ];

    for (var event in sampleEvents) {
      await _eventRepository.createEvent(event: event);
    }

    // 🔹 Refresh UI
    await loadEvents(userId);
    _isLoading = false;
    notifyListeners();
  }
}
