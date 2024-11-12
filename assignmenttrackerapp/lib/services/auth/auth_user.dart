import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final bool _isEmailVerified;

  const AuthUser(this._isEmailVerified);

  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);

  bool get isEmailVerified => _isEmailVerified;
}
