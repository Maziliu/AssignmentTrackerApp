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
  DateTime? _selectedDate;

  // Function to pick a date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _createAssignment() async {
    final existingAssignment = _assignment;
    if (existingAssignment != null) {
      return;
    }

    final currentUser = AuthServices.firebase().currentUser!;
    final user = await CoreService().getUser(email: currentUser.email!);
    _assignment = await _assignmentsService.createAssignment(
        userId: user.id, dueDate: _selectedDate!, title: _titleController.text);
    if (mounted) {
      Navigator.pop(context);
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
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : _selectedDate.toString().split(' ')[0],
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _pickDate(context),
                  child: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createAssignment,
              child: const Text('Save Assignment'),
            ),
          ],
        ),
      ),
    );
  }
}
