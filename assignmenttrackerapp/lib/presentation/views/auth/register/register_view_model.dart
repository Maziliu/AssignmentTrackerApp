import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/services/auth/auth_exceptions.dart';
import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
import 'package:assignmenttrackerapp/presentation/routes/routes.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthServices _authService;

  bool _isLoading = false;

  RegisterViewModel({required AuthServices authService}) : _authService = authService;
  bool get isLoading => _isLoading;

  Future<void> register(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.createUser(email: email, password: password);
      await _authService.sendVerificationEmail();

      if (context.mounted) {
        Navigator.of(context).pushNamed(verifyEmailRoute);
      }
    } on WeakPasswordAuthException {
      if (context.mounted) {
        showErrorMessage('Password must be at least 6 characters long.');
      }
    } on EmailAlreadyInUseAuthException {
      if (context.mounted) {
        showErrorMessage('The email is already in use.');
      }
    } on InvalidEmailAuthException {
      if (context.mounted) showErrorMessage('Invalid email format.');
    } on OperationNotAllowedAuthException {
      if (context.mounted) {
        showErrorMessage('Email/password accounts are not enabled.');
      }
    } on UserDisabledAuthException {
      if (context.mounted) {
        showErrorMessage('This account has been disabled.');
      }
    } on TooManyRequestsAuthException {
      if (context.mounted) {
        showErrorMessage('Too many requests. Try again later.');
      }
    } on NetworkRequestFailedAuthException {
      if (context.mounted) {
        showErrorMessage('Network error. Please check your connection.');
      }
    } on GenericAuthException {
      if (context.mounted) showErrorMessage('Registration Failed.');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
