import 'package:assignmenttrackerapp/common/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';

class AppModelTimeSlot extends AppModel {
  final int _userId;
  final DaysOfTheWeek _endingDay;
  final DateTime? _startDate;
  final DateTime _endDate;

  AppModelTimeSlot(
      {required super.id,
      required int userId,
      required DaysOfTheWeek endingDay,
      required DateTime? startDate,
      required DateTime endDate})
      : _userId = userId,
        _endingDay = endingDay,
        _startDate = startDate,
        _endDate = endDate;

  DaysOfTheWeek get endingDayOfTheWeek => _endingDay;
  DateTime? get startDate => _startDate;
  DateTime get endDate => _endDate;
  int get ownerId => _userId;

  bool get isDeadline => _startDate == null;
}
