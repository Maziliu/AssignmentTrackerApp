import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class ScheduleViewModel extends ChangeNotifier {
  final EventRepository _eventRepository;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<AppModelEvent> _events = [];
  List<AppModelEvent> get events => _events;

  ScheduleViewModel({required EventRepository eventRepository})
      : _eventRepository = eventRepository {
    _fetchEventsForNext14Days();
  }

  Future<void> _fetchEventsForNext14Days() async {
    _isLoading = true;
    notifyListeners();

    final Result<List<AppModelEvent>> result =
        await _eventRepository.getAllEventsForNext14DaysByUserId(
            userId: Provider.of<AuthViewModel>(context as BuildContext,
                    listen: false)
                .userId!);

    switch (result) {
      case Ok():
        _events = result.value;
      case Error():
        _events = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
