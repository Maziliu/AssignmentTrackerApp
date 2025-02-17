import 'package:assignmenttrackerapp/core/themes/themes.dart';
import 'package:assignmenttrackerapp/presentation/views/assignments/add_assignment_view.dart';
import 'package:assignmenttrackerapp/presentation/views/courses/add_course_view.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/presentation/routes/routes.dart';
import 'package:assignmenttrackerapp/core/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/login_view.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/register_view.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/verify_email_view.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        addAssignmentRoute: (context) => const AddAssignmentView(),
        addCourseRoute: (context) => const AddCourseView(),
      },
    );
  }
}
