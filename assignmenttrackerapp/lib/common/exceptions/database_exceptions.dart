//Database Exceptions
class ExistingDatabaseException implements Exception {}

class DocumentsDirectoryNotFoundException implements Exception {}

class NonExistentDatabaseException implements Exception {}

class UnableToCreateDatabaseEntryException implements Exception {}

class UnableToUpdateDatabaseEntryException implements Exception {}

class UnableToDeleteDatabaseEntryException implements Exception {}

//Assignment Table
class UnableToDeleteAssignmentException implements Exception {}

class AssignmentNotFoundException implements Exception {}

class UnableToUpdateAssignmentException implements Exception {}

//TimeSlot Table
class FailedToRetrieveTimeSlotException implements Exception {}

class UnableToDeleteTimeSlotException implements Exception {}

class UnableToUpdateTimeSlotException implements Exception {}

class UnableToCreateTimeSlotException implements Exception {}

//GradedComponent Table
class FailedToRetrieveGradedComponentException implements Exception {}

class UnableToDeleteGradedComponentException implements Exception {}

class UnableToUpdateGradedComponentException implements Exception {}

class UnableToCreateGradedComponentException implements Exception {}

//GradeScale Table
class FailedToRetrieveGradeScaleException implements Exception {}

class UnableToDeleteGradeScaleException implements Exception {}

class UnableToUpdateGradeScaleException implements Exception {}

class UnableToCreateGradeScaleException implements Exception {}

//Event Table
class FailedToRetrieveEventException implements Exception {}

class UnableToDeleteEventException implements Exception {}

class UnableToUpdateEventException implements Exception {}

class UnableToCreateEventException implements Exception {}

class SimultaneousNullEventAndTimeSlotException implements Exception {}

//Course Table
class FailedToRetrieveCourseException implements Exception {}

class UnableToDeleteCourseException implements Exception {}

class UnableToUpdateCourseException implements Exception {}

class UnableToCreateCourseException implements Exception {}

//Assessment Table
class FailedToRetrieveAssessmentException implements Exception {}

class UnableToDeleteAssessmentException implements Exception {}

class UnableToUpdateAssessmentException implements Exception {}

class UnableToCreateAssessmentException implements Exception {}

//Profile Table
class FailedToRetrieveProfileException implements Exception {}

class UnableToDeleteProfileException implements Exception {}

class UnableToUpdateProfileException implements Exception {}

class UnableToCreateProfileException implements Exception {}

//User Table
class UnableToCreateUserException implements Exception {}

class UserNotFoundException implements Exception {}

class ExistingUserException implements Exception {}

class FailedToRetrieveUserException implements Exception {}

class UnableToDeleteUserException implements Exception {}

class UnableToUpdateUserException implements Exception {}

//General
class UserExistenceCheckFailed implements Exception {}
