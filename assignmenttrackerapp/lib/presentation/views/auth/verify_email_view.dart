import 'package:assignmenttrackerapp/presentation/routes/routes.dart';
import 'package:assignmenttrackerapp/services/auth/auth_exceptions.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/common/utils/snackbar_helpers.dart';
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
      if (mounted) {
        showSuccessMessage('Verification email sent.');
      }
    } on TooManyRequestsAuthException {
      if (mounted) {
        showErrorMessage('Too many requests. Please try again later.');
      }
    } on NetworkRequestFailedAuthException {
      if (mounted) {
        showErrorMessage('Network error. Please check your connection.');
      }
    } on GenericAuthException {
      if (mounted) {
        showErrorMessage('An error occurred. Please try again.');
      }
    }
  }

  Future<void> _restart() async {
    await AuthServices.firebase().logout();
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        registerRoute,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'An email has been sent to your registered address.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'If you have not received the email, click the button below to resend it.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _verifyEmail,
              child: const Text('Resend Verification Email'),
            ),
            TextButton(
              onPressed: _restart,
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
