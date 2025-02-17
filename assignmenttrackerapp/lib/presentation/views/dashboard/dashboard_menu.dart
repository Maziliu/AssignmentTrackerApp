import 'package:assignmenttrackerapp/common/enums/overflow_menu_options.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  final DashboardViewModel viewModel;

  const DashboardMenu({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<OverflowMenuOptions>(
      onSelected: (value) {
        if (value == OverflowMenuOptions.logout) {
          viewModel.logout();
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: OverflowMenuOptions.logout,
          child: Text("Logout"),
        ),
      ],
    );
  }
}
