import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final bool _isEmailVerified;
  final String? _email;
  final String _uid;

  factory AuthUser.fromFirebase(User user) => AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
        uid: user.uid,
      );

  const AuthUser({required bool isEmailVerified, required String? email, required String uid})
      : _isEmailVerified = isEmailVerified,
        _email = email,
        _uid = uid;

  bool get isEmailVerified => _isEmailVerified;
  String? get email => _email;
  String get uid => _uid;
}
