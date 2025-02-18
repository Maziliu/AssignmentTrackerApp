import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttrackerapp/presentation/views/schedule/schedule_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';
import 'package:assignmenttrackerapp/data/models/app_model_time_slot.dart';
import 'package:assignmenttrackerapp/dependency_injection_container.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        if (authViewModel.userId == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ChangeNotifierProvider(
          create: (context) => injector<ScheduleViewModel>(),
          child: Consumer<ScheduleViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Scaffold(
                body: Stack(
                  children: [
                    CustomScrollView(
                      controller: viewModel.scrollController,
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                _buildSectionTitle("Today's Schedule"),
                                _buildEventList(
                                  context,
                                  eventsMap: viewModel.timeToEventMap,
                                  onDelete: viewModel.deleteEvent,
                                  onUpdate: viewModel.updateEvent,
                                  todayOnly: true,
                                ),
                                const SizedBox(height: 24),
                                _buildSectionTitle('Upcoming Events'),
                                _buildEventList(
                                  context,
                                  eventsMap: viewModel.timeToEventMap,
                                  onDelete: viewModel.deleteEvent,
                                  onUpdate: viewModel.updateEvent,
                                  todayOnly: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // FAB Positioned at the Bottom
                    Positioned(
                      bottom: 20,
                      right: 16,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: viewModel.isFloatingActionButtonVisible ? 1.0 : 0.0,
                        child: FloatingActionButton(
                          onPressed: () {
                            final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
                            if (authViewModel.userId != null) {
                              // Open event creation dialog
                            }
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEventList(
    BuildContext context, {
    required Map<AppModelTimeSlot, List<AppModelEvent>> eventsMap,
    required Future<void> Function({required int timeslotId, required int eventId}) onDelete,
    required Future<void> Function(int eventId) onUpdate,
    required bool todayOnly,
  }) {
    final events = eventsMap.entries.where((entry) {
      final eventDay = entry.key.startDate?.day;
      final today = DateTime.now().day;

      return todayOnly ? (eventDay != null && eventDay == today) : (eventDay == null || eventDay != today);
    });

    if (events.isEmpty) {
      return const Text(
        'No events available.',
        style: TextStyle(color: Colors.grey),
      );
    }

    return Column(
      children: events.expand((entry) {
        return entry.value.map((event) => _buildScheduleItem(
              context: context,
              event: event,
              timeslot: entry.key,
              onUpdate: onUpdate,
              onDelete: onDelete,
            ));
      }).toList(),
    );
  }

  Widget _buildScheduleItem({
    required BuildContext context,
    required AppModelEvent event,
    required AppModelTimeSlot timeslot,
    required void Function(int eventId) onUpdate,
    required Future<void> Function({required int timeslotId, required int eventId}) onDelete,
  }) {
    return Dismissible(
      key: Key(event.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text('Are you sure you want to delete this event?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: const Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        onDelete(timeslotId: timeslot.id!, eventId: event.id!);
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          onTap: () => onUpdate(event.id!),
          title: Text(event.eventName),
          subtitle: Text(timeslot.toString()),
        ),
      ),
    );
  }
}
