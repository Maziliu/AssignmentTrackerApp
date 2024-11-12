import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/services/auth/auth_exceptions.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  Future<void> _verifyEmail() async {
    try {
      await AuthServices.firebase().sendVerificationEmail();
    } on TooManyRequestsAuthException {
      if (mounted) {
        showErrorMessage(context, 'Too many requests. Please try again later.');
      }
    } on NetworkRequestFailedAuthException {
      if (mounted) {
        showErrorMessage(
            context, 'Network error. Please check your connection.');
      }
    } on GenericAuthException {
      if (mounted) {
        showErrorMessage(context, 'An error occurred');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Column(
        children: [
          const Text("An email has been sent"),
          const Text(
              "If you have not received the email, click the button below"),
          TextButton(
            onPressed: () async {
              await _verifyEmail();
            },
            child: const Text("Send email verification"),
          ),
          TextButton(
            onPressed: () async {
              await AuthServices.firebase().logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }
}
