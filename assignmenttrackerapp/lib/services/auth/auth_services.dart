import 'package:assignmenttrackerapp/services/auth/auth_strategy.dart';
import 'package:assignmenttrackerapp/services/auth/auth_user.dart';
import 'package:assignmenttrackerapp/services/auth/firebase_auth_strategy.dart';

class AuthServices implements AuthStrategy {
  final AuthStrategy _authStrategy;
  const AuthServices(this._authStrategy);

  //Define all factories of future auth strategies
  factory AuthServices.firebase() => AuthServices(FirebaseAuthStrategy());

  @override
  Future<AuthUser> createUser(
          {required String email, required String password}) =>
      _authStrategy.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => _authStrategy.currentUser;

  @override
  Future<void> initialize() => _authStrategy.initialize();

  @override
  Future<AuthUser> login({required String email, required String password}) =>
      _authStrategy.login(email: email, password: password);

  @override
  Future<void> logout() => _authStrategy.logout();

  @override
  Future<void> sendVerificationEmail() => _authStrategy.sendVerificationEmail();
}
