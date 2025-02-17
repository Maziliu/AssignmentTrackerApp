import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
import 'package:assignmenttrackerapp/dependency_injection_container.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/schedule/schedule_view_model.dart';
import 'package:assignmenttrackerapp/presentation/widgets/standard_editable_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttrackerapp/data/models/app_model_event.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        if (authViewModel.userId == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ChangeNotifierProvider.value(
          value: injector<ScheduleViewModel>(),
          child: Scaffold(
            body: Consumer<ScheduleViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Today's Schedule",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      if (viewModel.events.isEmpty)
                        const Text("No events today!",
                            style: TextStyle(color: Colors.grey))
                      else
                        ...viewModel.events.map(
                            (event) => _buildScheduleItem(event, viewModel)),
                      const SizedBox(height: 24),
                      const Text("Upcoming Events",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      if (viewModel.events.isEmpty)
                        const Text("No upcoming events.",
                            style: TextStyle(color: Colors.grey))
                      else
                        ...viewModel.events.map(
                            (event) => _buildScheduleItem(event, viewModel)),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final scheduleViewModel =
                    Provider.of<ScheduleViewModel>(context, listen: false);
                final authViewModel =
                    Provider.of<AuthViewModel>(context, listen: false);
                if (authViewModel.userId != null) {
                  scheduleViewModel.addSampleEvents(authViewModel.userId!);
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScheduleItem(AppModelEvent event, ScheduleViewModel viewModel) {
    return StandardEditableItemWidget<AppModelEvent>(
      data: event,
      titleBuilder: (event) => event.eventName,
      subtitle1Builder: (event) => "Time Slot: ${event.timeSlotId}",
      subtitle2Builder: (event) => "Event ID: ${event.id ?? 'N/A'}",
      onUpdate: () async {
        await viewModel.updateEvent();
      },
      onDelete: () async {
        await viewModel.deleteEvent();
      },
    );
  }
}
