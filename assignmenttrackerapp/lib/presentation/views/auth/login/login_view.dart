import 'package:assignmenttrackerapp/dependency_injection_container.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignmenttrackerapp/presentation/routes/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => injector<LoginViewModel>(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Login')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _email,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 24),
                  viewModel.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: viewModel.isLoading || viewModel.isLoggingIn
                              ? null
                              : () async {
                                  await viewModel.login(context, _email.text, _password.text);
                                },
                          child: const Text('Login'),
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
        },
      ),
    );
  }
}
