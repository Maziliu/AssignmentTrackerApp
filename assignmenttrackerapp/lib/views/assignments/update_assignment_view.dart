import 'package:assignmenttrackerapp/models/db_assignment.dart';
import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:assignmenttrackerapp/views/widgets/standard_column.dart';
import 'package:assignmenttrackerapp/views/widgets/standard_text_field.dart';
import 'package:flutter/material.dart';

class UpdateAssignmentView extends StatefulWidget {
  final DatabaseAssignment _assignment;

  const UpdateAssignmentView(
      {super.key, required DatabaseAssignment assignment})
      : _assignment = assignment;

  @override
  State<UpdateAssignmentView> createState() => _UpdateAssignmentViewState();
}

class _UpdateAssignmentViewState extends State<UpdateAssignmentView> {
  late final AssignmentsService _assignmentsService;
  late final TextEditingController _titleController, _courseController;
  DateTime? _selectedDateTime;

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

  void _updateAssignment() {
    try {
      _assignmentsService.updateAssignment(
        originalAssignment: widget._assignment,
        dueDate: _selectedDateTime!,
        title: _titleController.text,
        course: _courseController.text,
      );
    } on Exception catch (_) {
      throw UnableToUpdateAssignmentException();
    }
  }

  @override
  void initState() {
    _assignmentsService = AssignmentsService();
    _titleController = TextEditingController(text: widget._assignment.title);
    _courseController = TextEditingController(text: widget._assignment.course);
    _selectedDateTime = widget._assignment.dueDate;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Update Assignment'),
      ),
      body: SingleChildScrollView(
        child: StandardColumn(
          children: [
            StandardTextField(
              labelText: 'Assignment Name',
              controller: _titleController,
            ),
            StandardTextField(
              labelText: 'Course Name',
              controller: _courseController,
            ),
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
            ElevatedButton(
              onPressed: () {
                _updateAssignment();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
