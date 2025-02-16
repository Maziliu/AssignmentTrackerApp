import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';

class AppModelTimeSlot extends AppModel {
  final int _referenceId;
  final DaysOfTheWeek _endingDay;
  final DateTime? _startDate;
  final DateTime _endDate;

  AppModelTimeSlot(
      {required super.id,
      required int referenceId,
      required DaysOfTheWeek endingDay,
      required DateTime? startDate,
      required DateTime endDate})
      : _referenceId = referenceId,
        _endingDay = endingDay,
        _startDate = startDate,
        _endDate = endDate;

  int get referenceId => _referenceId;
  DaysOfTheWeek get endingDayOfTheWeek => _endingDay;
  DateTime? get startDate => _startDate;
  DateTime get endDate => _endDate;

  bool get isDeadline => _startDate == null;
}
