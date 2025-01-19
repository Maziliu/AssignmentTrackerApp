import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/services/auth/auth_exceptions.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/utils/snackbar_helpers.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  Future<void> _register(String email, String password) async {
    try {
      await AuthServices.firebase()
          .createUser(email: email, password: password);
      await AuthServices.firebase().sendVerificationEmail();
      if (mounted) {
        Navigator.of(context).pushNamed(
          verifyEmailRoute,
        );
      }
    } on WeakPasswordAuthException {
      if (mounted) {
        showErrorMessage(context,
            'The password is too weak. Must be at least 6 characters long');
      }
    } on EmailAlreadyInUseAuthException {
      if (mounted) {
        showErrorMessage(
            context, 'The email is already in use by another account.');
      }
    } on InvalidEmailAuthException {
      if (mounted) {
        showErrorMessage(context, 'The email address is badly formatted.');
      }
    } on OperationNotAllowedAuthException {
      if (mounted) {
        showErrorMessage(context, 'Email/password accounts are not enabled.');
      }
    } on UserDisabledAuthException {
      if (mounted) {
        showErrorMessage(context, 'This user account has been disabled.');
      }
    } on TooManyRequestsAuthException {
      if (mounted) {
        showErrorMessage(context, 'Too many requests. Please try again later.');
      }
    } on NetworkRequestFailedAuthException {
      if (mounted) {
        showErrorMessage(context, 'Too many requests. Please try again later.');
      }
    } on GenericAuthException {
      if (mounted) {
        showErrorMessage(context, 'Registration Failed');
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final String email = _email.text;
                final String password = _password.text;
                await _register(email, password);
              },
              child: const Text("Register"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
