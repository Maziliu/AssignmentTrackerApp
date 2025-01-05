import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:assignmenttrackerapp/services/database/classes/db_assignment.dart';
import 'package:assignmenttrackerapp/views/assignments/add_assignment_view.dart';
import 'package:flutter/material.dart';

class AssignmentsScreen extends StatefulWidget {
  final AssignmentsService _assignmentsService;

  const AssignmentsScreen({super.key, required assignmentsService})
      : _assignmentsService = assignmentsService;

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  @override
  void initState() {
    super.initState();
    // Load all assignments into the cache on initialization
    widget._assignmentsService.getAllAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<DatabaseAssignment>>(
        stream: widget._assignmentsService.cache.cacheStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final assignments = snapshot.data!;
            assignments.sort((a, b) => a.dueDate.compareTo(b.dueDate));
            return ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                return ListTile(
                  title: Text(
                    assignment.title,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'Due: ${assignment.dueDate.toString().split(' ')[0]}',
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text("No assignments found."),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddAssignmentView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
