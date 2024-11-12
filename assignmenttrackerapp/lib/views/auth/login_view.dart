import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/services/auth/auth_exceptions.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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

  Future<void> _signIn(String email, String password) async {
    try {
      await AuthServices.firebase().login(email: email, password: password);

      final user = AuthServices.firebase().currentUser;

      if (mounted) {
        if (user?.isEmailVerified ?? false) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            dashboardRoute,
            (route) => false,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            verifyEmailRoute,
            (route) => false,
          );
        }
      }
    } on UserNotFoundAuthException catch (_) {
      if (mounted) {
        showErrorMessage(context, "User not found");
      }
    } on InvalidCredentialsAuthException catch (_) {
      if (mounted) {
        showErrorMessage(context, "Invalid Email or Password");
      }
    } on GenericAuthException catch (_) {
      if (mounted) {
        showErrorMessage(context, "Authentication Error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final String email = _email.text;
                final String password = _password.text;
                await _signIn(email, password);
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text("Don't have an account? Register here!"),
            ),
          ],
        ),
      ),
    );
  }
}
