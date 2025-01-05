import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final bool _isEmailVerified;
  final String? _email;

  const AuthUser({required bool isEmailVerified, required String? email})
      : _isEmailVerified = isEmailVerified,
        _email = email;

  factory AuthUser.fromFirebase(User user) => AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
      );

  bool get isEmailVerified => _isEmailVerified;
  String? get email => _email;
}
