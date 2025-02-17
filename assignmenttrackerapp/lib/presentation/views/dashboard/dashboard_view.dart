import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_menu.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_navigation.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DashboardViewModel>(context);

    if (viewModel.isLoggedOut) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
        viewModel.resetLogoutFlag();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(DashboardNavigation(viewModel: viewModel).selectedTitle),
        actions: [DashboardMenu(viewModel: viewModel)],
      ),
      body: DashboardNavigation(viewModel: viewModel).selectedScreen,
      bottomNavigationBar: DashboardNavigation(viewModel: viewModel),
    );
  }
}
