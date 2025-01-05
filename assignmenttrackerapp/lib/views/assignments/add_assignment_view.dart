import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:assignmenttrackerapp/models/db_assignment.dart';
import 'package:assignmenttrackerapp/services/database/core_service.dart';
import 'package:flutter/material.dart';

class AddAssignmentView extends StatefulWidget {
  const AddAssignmentView({super.key});

  @override
  State<AddAssignmentView> createState() => _AddAssignmentViewState();
}

class _AddAssignmentViewState extends State<AddAssignmentView> {
  DatabaseAssignment? _assignment;
  late final AssignmentsService _assignmentsService;
  late final TextEditingController _titleController;
  late final TextEditingController _courseController;
  DateTime? _selectedDateTime;
  int _selectedRepeatIntervalLengthInDays = 1;
  int _selectedRepeatAmount = 0;

  Future<void> _pickDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      if (context.mounted) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
        );

        if (pickedTime != null) {
          final selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );

          setState(() {
            _selectedDateTime = selectedDateTime;
          });
        }
      }
    }
  }

  Future<void> _createAssignment(BuildContext context) async {
    final existingAssignment = _assignment;
    if (existingAssignment != null) {
      return;
    }

    final currentUser = AuthServices.firebase().currentUser!;
    final user = await CoreService().getUser(email: currentUser.email!);

    for (int i = 0; i <= _selectedRepeatAmount; i++) {
      int selectedInMs = _selectedDateTime!.millisecondsSinceEpoch;
      int offsetInMs = 86400000 * i * _selectedRepeatIntervalLengthInDays;

      DateTime dueDate =
          DateTime.fromMillisecondsSinceEpoch(selectedInMs + offsetInMs);

      String title = "${_titleController.text} ${(i + 1)}";

      _assignment = await _assignmentsService.createAssignment(
        userId: user.id,
        dueDate: dueDate,
        title: title,
        course: _courseController.text,
      );
    }

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _deleteEmptyAssignment() {
    if (_titleController.text.isEmpty && _assignment != null) {
      _assignmentsService.deleteAssignment(id: _assignment!.id);
    }
  }

  @override
  void initState() {
    _assignmentsService = AssignmentsService();
    _titleController = TextEditingController();
    _courseController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _courseController.dispose();
    _deleteEmptyAssignment();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Assignment Name',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _courseController,
              decoration: InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _selectedDateTime == null
                      ? 'No date selected'
                      : "${_selectedDateTime.toString().split(' ')[0]} at ${_selectedDateTime.toString().split(' ')[1].split('.')[0]}",
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _pickDateAndTime(context),
                  child: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Repeat every'),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<int>(
                      value: _selectedRepeatIntervalLengthInDays,
                      items: List.generate(
                        30,
                        (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text((index + 1).toString()),
                        ),
                        growable: true,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRepeatIntervalLengthInDays = newValue!;
                        });
                      },
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text('days '),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<int>(
                      value: _selectedRepeatAmount,
                      items: List.generate(
                        31,
                        (index) => DropdownMenuItem<int>(
                          value: index,
                          child: Text((index).toString()),
                        ),
                        growable: true,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRepeatAmount = newValue!;
                        });
                      },
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text('times'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createAssignment(context);
              },
              child: const Text('Save Assignment'),
            ),
          ],
        ),
      ),
    );
  }
}
