import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/views/auth/login_view.dart';
import 'package:assignmenttrackerapp/views/auth/register_view.dart';
import 'package:assignmenttrackerapp/views/auth/verify_email_view.dart';
import 'package:assignmenttrackerapp/views/dashboard_view.dart';

final ThemeData assignmentTrackerTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF1E1E2F), // Cool Dark Gray
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge:
        TextStyle(color: Color(0xFF00CFFD)), // Neon Blue for headlines
    headlineSmall: TextStyle(
        color: Color(0xFFBB86FC)), // Electric Purple for secondary headlines
    bodyLarge: TextStyle(color: Colors.white),
    bodySmall:
        TextStyle(color: Color(0xFFA0A0B0)), // Muted gray for secondary text
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E2F), // Cool Dark Gray for AppBar
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF00CFFD), // Neon Blue for buttons
      foregroundColor: Color(0xFF1E1E2F), // Button text matches background
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF2A2A3C), // Dark gray for text fields background
    labelStyle: TextStyle(color: Color(0xFF00CFFD)), // Neon Blue label color
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color(0xFFBB86FC)), // Electric Purple border
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Color(0xFF00CFFD), width: 2), // Neon Blue focused border
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  scaffoldBackgroundColor:
      Color(0xFF121212), // Almost black for a clean modern look
);

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
