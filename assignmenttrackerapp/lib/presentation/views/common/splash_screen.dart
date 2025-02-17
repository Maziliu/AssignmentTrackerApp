import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToInitialScreen();
  }

  Future<void> _navigateToInitialScreen() async {
    final viewModel = context.read<AuthViewModel>();
    final initialRoute = await viewModel.getInitialRoute();

    if (mounted) {
      Navigator.of(context).pushReplacementNamed(initialRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
