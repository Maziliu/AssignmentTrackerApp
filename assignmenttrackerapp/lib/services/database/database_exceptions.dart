//Database Exceptions
class ExistingDatabaseException implements Exception {}

class DocumentsDirectoryNotFoundException implements Exception {}

class NonExistentDatabaseException implements Exception {}

//Assignment Table
class UnableToDeleteAssignmentException implements Exception {}

class AssignmentNotFoundException implements Exception {}

class UnableToUpdateAssignmentException implements Exception {}

//User Table
class UnableToCreateUserException implements Exception {}

class UserNotFoundException implements Exception {}

class ExistingUserException implements Exception {}

//Course Table
class InvalidArrayLengthException implements Exception {}

class InvalidBitmaskValueException implements Exception {}

class UnableToDeleteCourseException implements Exception {}

class CourseNotFoundException implements Exception {}

class UnableToUpdateCourseException implements Exception {}

//Event Table
class UnableToGetEventException implements Exception {}

class UnableToDeleteEventException implements Exception {}

class UnableToUpdateEventException implements Exception {}
