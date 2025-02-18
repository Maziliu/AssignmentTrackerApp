import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';

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
    final theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(data.hashCode),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white, size: 28),
      ),
      confirmDismiss: (direction) async => await _confirmDelete(context),
      onDismissed: (direction) async => await onDelete(),
      child: Card(
        color: theme.cardTheme.color,
        elevation: theme.cardTheme.elevation,
        shape: theme.cardTheme.shape,
        margin: theme.cardTheme.margin,
        shadowColor: theme.cardTheme.shadowColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleBuilder(data),
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle1Builder(data),
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      subtitle2Builder(data),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit, color: theme.colorScheme.primary, size: 26),
                onPressed: () async => await _handleUpdate(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleUpdate(BuildContext context) async {
    try {
      await onUpdate();
      if (context.mounted) showSuccessMessage('Item updated successfully');
    } catch (e) {
      if (context.mounted) showErrorMessage('Failed to update item: $e');
    }
  }

  Future<bool?> _confirmDelete(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardTheme.color, // ✅ Dark theme support
        title: Text('Confirm Delete', style: Theme.of(context).textTheme.headlineSmall),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: Theme.of(context).textTheme.bodySmall),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
