import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';
import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay time, {bool use24HourFormat = false}) {
  final int hour = use24HourFormat
      ? time.hour
      : (time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod);
  final String period =
      use24HourFormat ? '' : (time.period == DayPeriod.am ? ' AM' : ' PM');
  final String minute = time.minute.toString().padLeft(2, '0');

  return '$hour:$minute$period';
}

String encodeTimeSlots(List<Pair<TimeOfDay?, TimeOfDay?>> timeSlots) {
  List<String> pairStrings = [];

  for (var pair in timeSlots) {
    String startTime = pair.first != null ? pair.first!.toString() : '';
    String endTime = pair.second != null ? pair.second!.toString() : '';

    pairStrings.add('$startTime,$endTime');
  }

  return pairStrings.join(';');
}

int encodeScheduledDaysArray(List<bool> scheduledDays) {
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

List<bool> decodeScheduledDaysArray(int encodedVal) {
  if (encodedVal > 127) {
    throw InvalidBitmaskValueException();
  }

  return [for (int i = 0; i < 7; i++) (encodedVal & (1 << i) != 0)];
}

List<Pair<TimeOfDay?, TimeOfDay?>> decodeTimeSlots(String encodedString) {
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
