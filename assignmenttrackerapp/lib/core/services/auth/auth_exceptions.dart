//Login Exceotions
class UserNotFoundAuthException implements Exception {}

class InvalidCredentialsAuthException implements Exception {}

//Register Exceptions
class InvalidEmailAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class OperationNotAllowedAuthException implements Exception {}

class UserDisabledAuthException implements Exception {}

//Other Exceptions
class TooManyRequestsAuthException implements Exception {}

class NetworkRequestFailedAuthException implements Exception {}

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
