import 'package:flutter/material.dart';

class TaskWidget<K> extends StatelessWidget {
  final K data;
  final String Function(K) titleBuilder;
  final String Function(K) subtitleBuilder;
  final String Function(K) locationBuilder;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const TaskWidget({
    super.key,
    required this.data,
    required this.titleBuilder,
    required this.subtitleBuilder,
    required this.locationBuilder,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text(
          titleBuilder(data),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${subtitleBuilder(data)}\n${locationBuilder(data)}',
          style: const TextStyle(color: Colors.grey),
        ),
        isThreeLine: true,
        onTap: onUpdate,
        onLongPress: () async {
          final shouldDelete = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Confirm Delete'),
              content: const Text('Are you sure you want to delete this task?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );

          if (shouldDelete == true) {
            onDelete();
          }
        },
      ),
    );
  }
}
