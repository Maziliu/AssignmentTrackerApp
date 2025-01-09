import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';
import 'package:flutter/material.dart';

class DayPickerWithTimeInterval extends StatefulWidget {
  final void Function(int index, List<bool> statesVector)
      _toggleDaysOfTheWeekButton;
  final List<bool> _daysToggleStates;
  final String? _label;
  final Pair<TimeOfDay, TimeOfDay> _timeInterval;

  const DayPickerWithTimeInterval({
    super.key,
    required List<bool> daysToggleStates,
    required void Function(int index, List<bool> statesVector)
        toggleDaysOfTheWeekButton,
    required String? label,
    required Pair<TimeOfDay, TimeOfDay> timeInterval,
  })  : _daysToggleStates = daysToggleStates,
        _toggleDaysOfTheWeekButton = toggleDaysOfTheWeekButton,
        _label = label,
        _timeInterval = timeInterval;

  @override
  State<DayPickerWithTimeInterval> createState() =>
      _DayPickerWithTimeIntervalState();
}

class _DayPickerWithTimeIntervalState extends State<DayPickerWithTimeInterval> {
  TimeOfDay? _chosenLowerBound, _chosenUpperBound;

  Future<void> _pickTime(BuildContext context, bool isLowerBound) async {
    final TimeOfDay? chosenTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (chosenTime == null) {
      return;
    }

    setState(() {
      if (isLowerBound) {
        _chosenLowerBound = chosenTime;
      } else {
        _chosenUpperBound = chosenTime;
      }

      if (_chosenLowerBound != null && _chosenUpperBound != null) {
        widget._timeInterval.first = _chosenLowerBound;
        widget._timeInterval.second = _chosenUpperBound;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget._label != null) Text(widget._label!),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            DaysOfTheWeek.values.length,
            (index) => IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  widget._daysToggleStates[index]
                      ? Color(0xFF1E1E2F) // Active background
                      : Color(0xFF121212), // Inactive background
                ),
              ),
              onPressed: () => widget._toggleDaysOfTheWeekButton(
                  index, widget._daysToggleStates),
              icon: Text(
                DaysOfTheWeek.values[index]
                    .toString()
                    .split('.')
                    .last
                    .substring(0, 2),
                style: TextStyle(
                  color: widget._daysToggleStates[index]
                      ? Color(0xFF00CFFD)
                      : Color(0xFFBB86FC),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Time interval: '),
            ElevatedButton(
              onPressed: () => _pickTime(context, true),
              child: Icon(Icons.alarm),
            ),
            Text('to'),
            ElevatedButton(
              onPressed: () => _pickTime(context, false),
              child: Icon(Icons.alarm),
            ),
          ],
        ),
      ],
    );
  }
}
