import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:assignmenttrackerapp/data/models/app_model_user.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/presentation/routes/routes.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthServices _authService;
  final UserRepository _userRepository;

  int? _userId;
  int? get userId => _userId;

  AuthViewModel({
    required AuthServices authService,
    required UserRepository userRepository,
  })  : _authService = authService,
        _userRepository = userRepository {
    _initializeAuthState();
  }

  Future<String> getInitialRoute() async {
    await _authService.initialize();
    final user = _authService.currentUser;

    await _setUserId(user?.uid);

    if (user == null) {
      return loginRoute;
    } else if (!user.isEmailVerified) {
      return verifyEmailRoute;
    } else {
      return dashboardRoute;
    }
  }

  void _initializeAuthState() {
    _authService.authStateChanges.listen((user) {
      _setUserId(user?.uid);
    });
  }

  Future<void> _setUserId(String? uid) async {
    if (uid == null) {
      _userId = null;
      notifyListeners();
      return;
    }

    final Result<int> result =
        await _userRepository.getUserByCloudSyncId(cloudSyncId: uid);
    switch (result) {
      case Ok():
        _userId = result.value;
      case Error():
        final newUser = AppModelUser(
          email: _authService.currentUser?.email ?? "unknown",
          username: _authService.currentUser?.email ?? "Unknown User",
          cloudDBSyncId: uid,
          id: null,
        );
        final createResult = await _userRepository.createUser(user: newUser);
        if (createResult is Ok) {
          _userId = newUser.id;
        } else {
          _userId = null;
        }
    }
    notifyListeners();
  }
}
