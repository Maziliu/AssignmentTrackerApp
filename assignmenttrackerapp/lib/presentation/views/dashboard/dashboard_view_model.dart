import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';

class DashboardViewModel extends ChangeNotifier {
  final AuthServices _authService;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  bool _isLoggedOut = false;
  bool get isLoggedOut => _isLoggedOut;

  DashboardViewModel({required AuthServices authService}) : _authService = authService;

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _isLoggedOut = true;
    notifyListeners();
  }

  void resetLogoutFlag() {
    _isLoggedOut = false;
    notifyListeners();
  }
}
