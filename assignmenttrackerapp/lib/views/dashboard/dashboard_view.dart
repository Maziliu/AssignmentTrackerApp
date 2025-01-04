import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/enums/overflow_menu_options.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:assignmenttrackerapp/themes/themes.dart';
import 'package:assignmenttrackerapp/utils/dialog_helpers.dart';
import 'package:assignmenttrackerapp/views/dashboard/assignments_screen.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedTabIndex = 0;
  late final AssignmentsService _assignmentsService;

  List<Widget> get mainScreens => [
        Center(child: Text('Daily')),
        AssignmentsScreen(assignmentsService: _assignmentsService),
        Center(child: Text('Exams'))
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _assignmentsService = AssignmentsService();
    _assignmentsService.openDB();
  }

  @override
  void dispose() {
    super.dispose();
    _assignmentsService.closeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        actions: [
          PopupMenuButton<OverflowMenuOptions>(
            onSelected: (value) async {
              switch (value) {
                case OverflowMenuOptions.logout:
                  final shouldLogout =
                      await showLogoutConfirmationDialog(context);
                  if (shouldLogout) {
                    await AuthServices.firebase().logout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<OverflowMenuOptions>(
                  value: OverflowMenuOptions.logout,
                  child: Text("Logout"),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(child: mainScreens[_selectedTabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
          )
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: assignmentTrackerTheme.colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
