import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/enums/overflow_menu_options.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/services/database/core_service.dart';
import 'package:assignmenttrackerapp/themes/themes.dart';
import 'package:assignmenttrackerapp/utils/dialog_helpers.dart';
import 'package:assignmenttrackerapp/views/assignments/assignments_view.dart';
import 'package:assignmenttrackerapp/views/courses/courses_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedTabIndex = 0;
  late final CoreService _coreService;
  late final Future<DatabaseUser> _userFuture;

  List<Widget> get mainScreens => [
        const Center(child: Text('Daily')),
        AssignmentsView(assignmentsService: _coreService.assignmentsService),
        const Center(child: Text('Exams')),
        CoursesView(coursesService: _coreService.coursesService),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _coreService = CoreService();
    _coreService.openDB();
    _userFuture = _coreService.getOrCreateUser(
      email: AuthServices.firebase().currentUser!.email!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainScreens[_selectedTabIndex].toString()),
        actions: [
          PopupMenuButton<OverflowMenuOptions>(
            onSelected: (value) async {
              switch (value) {
                case OverflowMenuOptions.logout:
                  final shouldLogout =
                      await showLogoutConfirmationDialog(context);
                  if (shouldLogout) {
                    await AuthServices.firebase().logout();
                    if (mounted) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (route) => false,
                      );
                    }
                  }
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem<OverflowMenuOptions>(
                value: OverflowMenuOptions.logout,
                child: Text("Logout"),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<DatabaseUser>(
        future: _userFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return mainScreens[_selectedTabIndex];
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return const Center(
                child: Text('Unexpected state.'),
              );
          }
        },
      ),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: assignmentTrackerTheme.colorScheme.primary,
        unselectedItemColor: assignmentTrackerTheme.colorScheme.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}
