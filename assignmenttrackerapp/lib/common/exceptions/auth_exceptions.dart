/// Authentication-related exceptions
library;

// Base Auth Exception
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

// Login Exceptions
class UserNotFoundAuthException extends AuthException {
  UserNotFoundAuthException() : super('User not found. Please check your credentials.');
}

class InvalidCredentialsAuthException extends AuthException {
  InvalidCredentialsAuthException() : super('Invalid email or password. Please try again.');
}

// Registration Exceptions
class InvalidEmailAuthException extends AuthException {
  InvalidEmailAuthException() : super('The email address is invalid. Please enter a valid email.');
}

class WeakPasswordAuthException extends AuthException {
  WeakPasswordAuthException() : super('The password is too weak. Please use a stronger password.');
}

class EmailAlreadyInUseAuthException extends AuthException {
  EmailAlreadyInUseAuthException() : super('This email is already in use. Try logging in instead.');
}

class OperationNotAllowedAuthException extends AuthException {
  OperationNotAllowedAuthException() : super('This operation is not allowed. Please contact support.');
}

class UserDisabledAuthException extends AuthException {
  UserDisabledAuthException() : super('This user account has been disabled.');
}

// Other Exceptions
class TooManyRequestsAuthException extends AuthException {
  TooManyRequestsAuthException() : super('Too many login attempts. Please try again later.');
}

class NetworkRequestFailedAuthException extends AuthException {
  NetworkRequestFailedAuthException() : super('Network error. Please check your internet connection.');
}

class GenericAuthException extends AuthException {
  GenericAuthException() : super('An unknown authentication error occurred.');
}

class UserNotLoggedInAuthException extends AuthException {
  UserNotLoggedInAuthException() : super('User is not logged in. Please log in first.');
}
