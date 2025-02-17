import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';

class DashboardViewModel extends ChangeNotifier {
  final AuthServices _authService = GetIt.instance<AuthServices>();

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  late final List<String> _titles = [
    'Daily Schedule',
    'Assignments',
    'Exams',
    'Courses',
  ];
  String get selectedTitle => _titles[_selectedTabIndex];

  late final List<Widget> _screens = [
    const Center(child: Text('Dailies')),
    const Center(child: Text('Assignments')),
    const Center(child: Text('Exams')),
    const Center(child: Text('Courses')),
  ];
  Widget get selectedScreen => _screens[_selectedTabIndex];

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    await _authService.logout();
    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }
}
