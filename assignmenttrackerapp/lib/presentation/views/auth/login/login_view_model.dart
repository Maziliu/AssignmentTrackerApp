import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/services/auth/auth_exceptions.dart';
import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
import 'package:assignmenttrackerapp/presentation/routes/routes.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthServices _authService;
  bool _isLoading = false;
  bool _isLoggingIn = false; // Prevents multiple requests

  LoginViewModel({required AuthServices authService})
      : _authService = authService;

  bool get isLoading => _isLoading;
  bool get isLoggingIn => _isLoggingIn;

  Future<void> login(
      BuildContext context, String email, String password) async {
    if (_isLoggingIn) return; // Prevent duplicate login attempts
    _isLoggingIn = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.login(email: email, password: password);
      final user = _authService.currentUser;

      if (context.mounted) {
        if (user?.isEmailVerified ?? false) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(dashboardRoute, (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(verifyEmailRoute, (route) => false);
        }
      }
    } on UserNotFoundAuthException {
      if (context.mounted) showErrorMessage(context, "User not found");
    } on InvalidCredentialsAuthException {
      if (context.mounted) {
        showErrorMessage(context, "Invalid Email or Password");
      }
    } on GenericAuthException {
      if (context.mounted) showErrorMessage(context, "Authentication Error");
    } finally {
      _isLoggingIn = false;
      _isLoading = false;
      notifyListeners();
    }
  }
}
