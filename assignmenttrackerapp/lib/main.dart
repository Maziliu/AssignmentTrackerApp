import 'package:assignmenttrackerapp/common/constants/global_scaffold_key.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/login/login_view.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/register/register_view.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/verify_email_view.dart';
import 'package:assignmenttrackerapp/presentation/views/common/splash_screen.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/schedule/schedule_view_model.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttrackerapp/dependency_injection_container.dart';

import 'package:assignmenttrackerapp/presentation/routes/routes.dart';
import 'package:assignmenttrackerapp/common/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
  ));
  await AuthServices.firebase().initialize();
  setupDependencies();
  runApp(const AppEntryPoint());
}

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<AuthViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<DashboardViewModel>(),
        ),
        ChangeNotifierProvider<ScheduleViewModel>(
          create: (_) => GetIt.instance<ScheduleViewModel>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'Assignment Tracker',
        theme: assignmentTrackerTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          dashboardRoute: (context) => const DashboardView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
        },
      ),
    );
  }
}
