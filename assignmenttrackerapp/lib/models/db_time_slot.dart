import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseTimeSlot extends DatabaseObject {
  final int _referenceId;
  final TimeSlotType _type;
  final DaysOfTheWeek _endingDay;
  final DateTime? _startDate;
  final DateTime _endDate;

  DatabaseTimeSlot(
      {required super.id,
      required int referenceId,
      required TimeSlotType type,
      required DaysOfTheWeek endingDay,
      required DateTime? startDate,
      required DateTime endDate})
      : _referenceId = referenceId,
        _type = type,
        _endingDay = endingDay,
        _startDate = startDate,
        _endDate = endDate;

  DatabaseTimeSlot.fromRow(Map<String, Object?> row)
      : _referenceId = row['reference_id'] as int,
        _type = TimeSlotType.values.byName(row['type'] as String),
        _endingDay = DaysOfTheWeek.values[row['ending_day'] as int],
        _startDate =
            DateTime.fromMillisecondsSinceEpoch(row['start_date'] as int),
        _endDate = DateTime.fromMillisecondsSinceEpoch(row['end_date'] as int),
        super(id: row['id'] as int);

  int get referenceId => _referenceId;
  TimeSlotType get type => _type;
  DaysOfTheWeek get endingDayOfTheWeek => _endingDay;
  DateTime? get startDate => _startDate;
  DateTime get endDate => _endDate;
}
