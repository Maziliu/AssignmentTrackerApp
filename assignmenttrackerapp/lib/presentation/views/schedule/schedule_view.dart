import 'package:assignmenttrackerapp/dependency_injection_container.dart';
import 'package:assignmenttrackerapp/presentation/views/schedule/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => injector<ScheduleViewModel>(),
      child: Consumer<ScheduleViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Today's Schedule
                const Text("Today's Schedule",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                if (viewModel.events.isEmpty)
                  const Text("No events today!",
                      style: TextStyle(color: Colors.grey))
                else
                  ...viewModel.events.map((event) => _buildScheduleItem(event)),

                const SizedBox(height: 24),

                // 🔹 Weekly Schedule
                const Text("Upcoming Events",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                if (viewModel.events.isEmpty)
                  const Text("No upcoming events.",
                      style: TextStyle(color: Colors.grey))
                else
                  ...viewModel.events.map((event) => _buildScheduleItem(event)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildScheduleItem(AppModelEvent event) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(event.eventName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("Time Slot: ${event.timeSlotId}"),
        trailing: const Icon(Icons.event),
      ),
    );
  }
}
