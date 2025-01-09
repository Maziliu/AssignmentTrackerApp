import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/enums/event_type.dart';
import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';
import 'package:flutter/material.dart';

//Notes for how i am storing this in the DB.
//_scheduledDays is a bitmask of vals from 0 - 127.
//_timeSlots is a string of millisecsfromepoch sep by comm sep by semi colon
//others are standard
class DatabaseEvent implements DatabaseObject {
  final int _id, _userId, _courseId;
  final EventType _eventType;
  final List<bool> _scheduledDays = [for (int i = 0; i < 7; i++) false];
  final List<Pair<TimeOfDay?, TimeOfDay?>> _timeSlots = [
    for (int i = 0; i < 7; i++) Pair()
  ];

  DatabaseEvent({
    required int id,
    required int userId,
    required int courseId,
    required EventType eventType,
  })  : _id = id,
        _userId = userId,
        _courseId = courseId,
        _eventType = eventType;

  DatabaseEvent.fromRow(Map<String, Object?> row)
      : _id = row['id'] as int,
        _userId = row['user_id'] as int,
        _courseId = row['course_id'] as int,
        _eventType = EventType.values[row['event_type'] as int] {
    List<bool> decoded = decodeScheduledDaysArray(row['scheduled_days'] as int);
    for (int i = 0; i < decoded.length; i++) {
      _scheduledDays[i] = decoded[i];
    }

    List<Pair<TimeOfDay?, TimeOfDay?>> decodedTimeSlots =
        decodeTimeSlots(row['time_slots'] as String);
    for (int i = 0; i < decodedTimeSlots.length; i++) {
      if (decodedTimeSlots[i].isNotEmpty) {
        _timeSlots[i] = decodedTimeSlots[i];
      }
    }
  }

  static int encodeScheduledDaysArray(List<bool> scheduledDays) {
    if (scheduledDays.length != 7) {
      throw InvalidArrayLengthException();
    }

    int result = 0;
    for (int i = 0; i < 7; i++) {
      if (scheduledDays[i]) {
        result |= (1 << i);
      }
    }

    return result;
  }

  static List<bool> decodeScheduledDaysArray(int encodedVal) {
    if (encodedVal > 127) {
      throw InvalidBitmaskValueException();
    }

    return [for (int i = 0; i < 7; i++) (encodedVal & (1 << i) != 0)];
  }

  static List<Pair<TimeOfDay?, TimeOfDay?>> decodeTimeSlots(
      String encodedString) {
    List<String> pairStrings = encodedString.split(';');
    List<Pair<TimeOfDay?, TimeOfDay?>> result = [];

    for (String pair in pairStrings) {
      if (pair.isNotEmpty) {
        List<String> timeStrings = pair.split(',');

        TimeOfDay? startTime = timeStrings[0].isNotEmpty
            ? TimeOfDay.fromDateTime(DateTime.tryParse(timeStrings[0])!)
            : null;
        TimeOfDay? endTime = timeStrings.length > 1 && timeStrings[1].isNotEmpty
            ? TimeOfDay.fromDateTime(DateTime.tryParse(timeStrings[1])!)
            : null;

        result.add(Pair.pair(first: startTime, second: endTime));
      }
    }

    return result;
  }

  static String encodeTimeSlots(List<Pair<TimeOfDay?, TimeOfDay?>> timeSlots) {
    List<String> pairStrings = [];

    for (var pair in timeSlots) {
      String startTime = pair.first != null ? pair.first!.toString() : '';
      String endTime = pair.second != null ? pair.second!.toString() : '';

      pairStrings.add('$startTime,$endTime');
    }

    return pairStrings.join(';');
  }

  String formatTimeOfDay(TimeOfDay time, {bool use24HourFormat = false}) {
    final int hour = use24HourFormat
        ? time.hour
        : (time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod);
    final String period =
        use24HourFormat ? '' : (time.period == DayPeriod.am ? ' AM' : ' PM');
    final String minute = time.minute.toString().padLeft(2, '0');

    return '$hour:$minute$period';
  }

  List<bool> get scheduledDays => _scheduledDays;
  List<Pair<TimeOfDay?, TimeOfDay?>> get timeSlots => _timeSlots;
  int get courseId => _courseId;
  EventType get eventType => _eventType;
  int get id => _id;
  int get userId => _userId;

  String get scheduledDaysString {
    return [
      for (int i = 0; i < 7; i++)
        if (_scheduledDays[i]) DaysOfTheWeek.values[i]
    ].join(', ');
  }

  String get timeSlotsString {
    List<String> pairStrings = [];

    for (Pair p in timeSlots) {
      if (p.isNotEmpty) {
        String lowerBoundConverted = formatTimeOfDay(p.first);
        String upperBoundConverted = formatTimeOfDay(p.second);

        pairStrings.add([lowerBoundConverted, upperBoundConverted].join(' - '));
      }
    }

    return pairStrings.join(',');
  }

  set scheduledDays(List<bool> days) {
    for (int i = 0; i < days.length; i++) {
      _scheduledDays[i] = days[i];
    }
  }

  set timeSlots(List<Pair<TimeOfDay?, TimeOfDay?>> timeSlots) {
    for (int i = 0; i < timeSlots.length; i++) {
      _timeSlots[i] = timeSlots[i];
    }
  }

  @override
  String toString() {
    return 'ID: $_id, Days: $_scheduledDays, TimeSlots: $_timeSlots';
  }

  @override
  bool operator ==(covariant DatabaseObject other) {
    if (other is DatabaseEvent) {
      return _id == other._id;
    }

    return false;
  }

  @override
  int get hashCode {
    return _id.hashCode;
  }

  @override
  int get ownerId => _userId;
}
