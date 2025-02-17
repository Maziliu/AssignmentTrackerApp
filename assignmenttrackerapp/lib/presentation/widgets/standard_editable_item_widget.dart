import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
import 'package:flutter/material.dart';

class StandardEditableItemWidget<K> extends StatelessWidget {
  final K data;
  final String Function(K) titleBuilder;
  final String Function(K) subtitle1Builder;
  final String Function(K) subtitle2Builder;
  final Future<void> Function() onDelete;
  final Future<void> Function() onUpdate;

  const StandardEditableItemWidget({
    super.key,
    required this.data,
    required this.titleBuilder,
    required this.subtitle1Builder,
    required this.subtitle2Builder,
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
          '${subtitle1Builder(data)}\n${subtitle2Builder(data)}',
          style: const TextStyle(color: Colors.grey),
        ),
        isThreeLine: true,
        onTap: () async {
          _handleUpdate(context);
        },
        onLongPress: () async {
          _handleDelete(context);
        },
      ),
    );
  }

  Future<void> _handleUpdate(BuildContext context) async {
    try {
      await onUpdate();
      if (context.mounted) {
        showSuccessMessage(context, 'Item updated successfully');
      }
    } catch (e) {
      if (context.mounted) {
        showErrorMessage(context, 'Failed to update item: $e');
      }
    }
  }

  Future<void> _handleDelete(BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this item?'),
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
      try {
        await onDelete();
        if (context.mounted) {
          showSuccessMessage(context, 'Task deleted successfully');
        }
      } catch (e) {
        if (context.mounted) {
          showErrorMessage(context, 'Failed to delete item: $e');
        }
      }
    }
  }
}
