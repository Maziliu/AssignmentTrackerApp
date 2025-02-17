import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';

class ScheduleViewModel extends ChangeNotifier {
  final EventRepository _eventRepository;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<AppModelEvent> _events = [];
  List<AppModelEvent> get events => _events;

  ScheduleViewModel({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  Future<void> loadEvents(int? userId) async {
    _isLoading = true;
    notifyListeners();

    if (userId != null) {
      final result = await _eventRepository.getAllEventsForNext14DaysByUserId(
          userId: userId);

      switch (result) {
        case Ok<List<AppModelEvent>>():
          _events = result.value;
        case Error<List<AppModelEvent>>():
          _events = [];
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
