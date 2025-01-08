import 'package:assignmenttrackerapp/enums/days_of_the_week.dart';
import 'package:assignmenttrackerapp/themes/themes.dart';
import 'package:assignmenttrackerapp/views/widgets/standard_column.dart';
import 'package:assignmenttrackerapp/views/widgets/standard_text_field.dart';
import 'package:flutter/material.dart';

class AddCourseView extends StatefulWidget {
  const AddCourseView({super.key});

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  late final TextEditingController _courseNameController;

  List<bool> daysToggleStates = List.filled(7, false);

  @override
  void initState() {
    _courseNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    super.dispose();
  }

  void _toggleDaysOfTheWeekButton(int index) {
    setState(() {
      daysToggleStates[index] = !daysToggleStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StandardColumn(
          children: [
            TextField(
              controller: _courseNameController,
              style: assignmentTrackerTheme.textTheme.bodyLarge,
              decoration: InputDecoration(
                labelText: 'Course Name',
                labelStyle:
                    assignmentTrackerTheme.inputDecorationTheme.labelStyle,
                enabledBorder:
                    assignmentTrackerTheme.inputDecorationTheme.enabledBorder,
                focusedBorder:
                    assignmentTrackerTheme.inputDecorationTheme.focusedBorder,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                DaysOfTheWeek.values.length,
                (index) => IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      daysToggleStates[index]
                          ? Color(0xFF1E1E2F) // Active background
                          : Color(0xFF121212), // Inactive background
                    ),
                  ),
                  onPressed: () => _toggleDaysOfTheWeekButton(index),
                  icon: Text(
                    DaysOfTheWeek.values[index]
                        .toString()
                        .split('.')
                        .last
                        .substring(0, 2),
                    style: TextStyle(
                      color: daysToggleStates[index]
                          ? Color(0xFF00CFFD)
                          : Color(0xFFBB86FC),
                    ),
                  ),
                  isSelected: daysToggleStates[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
