import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';

class DashboardNavigation extends StatelessWidget {
  final DashboardViewModel viewModel;

  static const List<String> _titles = [
    'Daily Schedule',
    'Assignments',
    'Exams',
    'Courses',
  ];

  static const List<Widget> _screens = [
    Center(child: Text('Dailies')),
    Center(child: Text('Assignments')),
    Center(child: Text('Exams')),
    Center(child: Text('Courses')),
  ];

  const DashboardNavigation({super.key, required this.viewModel});

  String get selectedTitle => _titles[viewModel.selectedTabIndex];
  Widget get selectedScreen => _screens[viewModel.selectedTabIndex];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      onTap: viewModel.selectTab,
    );
  }
}
