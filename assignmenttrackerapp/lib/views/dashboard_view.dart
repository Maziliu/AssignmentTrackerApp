import 'package:assignmenttrackerapp/constants/routes.dart';
import 'package:assignmenttrackerapp/enums/overflow_menu_options.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/utils/dialog_helpers.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        actions: [
          PopupMenuButton<OverflowMenuOptions>(
            onSelected: (value) async {
              switch (value) {
                case OverflowMenuOptions.logout:
                  final shouldLogout =
                      await showLogoutConfirmationDialog(context);
                  if (shouldLogout) {
                    await AuthServices.firebase().logout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<OverflowMenuOptions>(
                  value: OverflowMenuOptions.logout,
                  child: Text("Logout"),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: const Text(
          "Hello World",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
