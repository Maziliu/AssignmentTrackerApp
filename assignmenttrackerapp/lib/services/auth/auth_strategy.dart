import 'package:assignmenttrackerapp/services/auth/auth_user.dart';

abstract class AuthStrategy {
  AuthUser? get currentUser;
  String? get uid;
  Future<void> initialize();
  Future<AuthUser> login({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<void> sendVerificationEmail();
  Stream<AuthUser?> get authStateChanges;
}
