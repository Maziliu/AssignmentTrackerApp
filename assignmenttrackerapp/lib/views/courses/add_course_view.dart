import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/services/database/core_service.dart';
import 'package:assignmenttrackerapp/services/database/courses/courses_service.dart';
import 'package:assignmenttrackerapp/themes/themes.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';
import 'package:assignmenttrackerapp/views/widgets/day_picker_with_time_interval.dart';
import 'package:assignmenttrackerapp/views/widgets/standard_column.dart';
import 'package:flutter/material.dart';

class AddCourseView extends StatefulWidget {
  const AddCourseView({super.key});

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  DatabaseCourse? _course;

  late final CoursesService _coursesService;

  late final TextEditingController _courseNameController;

  final List<bool> _courseDaysToggleStates = List.filled(7, false);
  final List<bool> _tutorialDaysToggleStates = List.filled(7, false);
  final List<bool> _labDaysToggleStates = List.filled(7, false);
  bool _tutorialIsChecked = false, _labIsChecked = false;
  Pair<TimeOfDay, TimeOfDay> courseTimeInterval = Pair(),
      tutorialTimeInterval = Pair(),
      labTimeInterval = Pair();

  void _createCourse(BuildContext context) async {
    if (_course != null) {
      return;
    }

    final currentUser = AuthServices.firebase().currentUser!;
    final user = await CoreService().getUser(email: currentUser.email!);

    try {
      final courseEventMap = {
        'scheduled_days': _courseDaysToggleStates,
        'time_slots': [courseTimeInterval]
      };

      final tutorialEventMap = {
        'scheduled_days': _tutorialDaysToggleStates,
        'time_slots': [tutorialTimeInterval]
      };

      final labEventMap = {
        'scheduled_days': _labDaysToggleStates,
        'time_slots': [labTimeInterval]
      };

      _course = await _coursesService.createCourse(
        userId: user.id,
        courseName: _courseNameController.text,
        courseEventMap: courseEventMap,
        tutorialEventMap: tutorialEventMap,
        labEventMap: labEventMap,
      );
    } on Exception {
      if (context.mounted) {
        rethrow;
      }
    }
  }

  void _deleteEmptyCourse() {
    if (_course != null && _courseNameController.text.isEmpty) {
      _coursesService.deleteCourseById(id: _course!.courseId);
    }
  }

  @override
  void initState() {
    _courseNameController = TextEditingController();
    _coursesService = CoursesService();
    super.initState();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _deleteEmptyCourse();
    super.dispose();
  }

  void _toggleDaysOfTheWeekButton(int index, List<bool> statesVector) {
    setState(() {
      statesVector[index] = !statesVector[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('New Course'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              DayPickerWithTimeInterval(
                label: 'Course',
                daysToggleStates: _courseDaysToggleStates,
                toggleDaysOfTheWeekButton: _toggleDaysOfTheWeekButton,
                timeInterval: courseTimeInterval,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Tutorials'),
                      Checkbox(
                        value: _tutorialIsChecked,
                        onChanged: (bool? val) {
                          setState(() {
                            _tutorialIsChecked = val ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Labs'),
                      Checkbox(
                        value: _labIsChecked,
                        onChanged: (bool? val) {
                          setState(() {
                            _labIsChecked = val ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              if (_tutorialIsChecked)
                DayPickerWithTimeInterval(
                  daysToggleStates: _tutorialDaysToggleStates,
                  toggleDaysOfTheWeekButton: _toggleDaysOfTheWeekButton,
                  label: 'Tutorial',
                  timeInterval: tutorialTimeInterval,
                ),
              if (_labIsChecked)
                DayPickerWithTimeInterval(
                  daysToggleStates: _labDaysToggleStates,
                  toggleDaysOfTheWeekButton: _toggleDaysOfTheWeekButton,
                  label: 'Lab',
                  timeInterval: labTimeInterval,
                ),
              ElevatedButton(
                onPressed: () async {
                  _createCourse(context);
                  Navigator.of(context).pop();
                },
                child: const Text('Save Course'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
