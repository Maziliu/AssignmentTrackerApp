import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UpdateAssignmentView extends StatefulWidget {
  const UpdateAssignmentView({super.key});

  @override
  State<UpdateAssignmentView> createState() => _UpdateAssignmentViewState();
}

class _UpdateAssignmentViewState extends State<UpdateAssignmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Assignment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(width: 20), TextFormField()],
        ),
      ),
    );
  }
}
