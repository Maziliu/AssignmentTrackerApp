import 'package:assignmenttrackerapp/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/views/auth/login_view.dart';
import 'package:assignmenttrackerapp/views/auth/register_view.dart';
import 'package:assignmenttrackerapp/views/auth/verify_email_view.dart';
import 'package:assignmenttrackerapp/views/dashboard/dashboard_view.dart';

void main() {
  runApp(const AppEntryPoint());
}

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({super.key});

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {
  Future<Widget> _routeView() async {
    await AuthServices.firebase().initialize();
    final user = AuthServices.firebase().currentUser;

    if (user == null) {
      return const LoginView();
    } else if (!user.isEmailVerified) {
      return const VerifyEmailView();
    } else {
      return const DashboardView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Tracker',
      theme: assignmentTrackerTheme,
      home: FutureBuilder<Widget>(
        future: _routeView(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return const LoginView();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        dashboardRoute: (context) => const DashboardView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
    );
  }
}
