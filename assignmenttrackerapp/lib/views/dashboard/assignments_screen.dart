import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:flutter/material.dart';

class AssignmentsScreen extends StatefulWidget {
  final AssignmentsService assignmentsService;

  const AssignmentsScreen({super.key, required this.assignmentsService});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Assignemtns')),
    );
  }
}
