import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttrackerapp/common/enums/overflow_menu_options.dart';
import 'package:assignmenttrackerapp/common/themes/themes.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardViewModel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.selectedTitle),
              actions: [
                PopupMenuButton<OverflowMenuOptions>(
                  onSelected: (value) {
                    if (value == OverflowMenuOptions.logout) {
                      viewModel.logout(context);
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: OverflowMenuOptions.logout,
                      child: Text("Logout"),
                    ),
                  ],
                ),
              ],
            ),
            body: viewModel.selectedScreen,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Daily Schedule',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment),
                  label: 'Assignments',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Exams',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Courses',
                ),
              ],
              currentIndex: viewModel.selectedTabIndex,
              selectedItemColor: assignmentTrackerTheme.colorScheme.primary,
              unselectedItemColor: assignmentTrackerTheme.colorScheme.secondary,
              onTap: viewModel.selectTab,
            ),
          );
        },
      ),
    );
  }
}
