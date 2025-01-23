import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/services/database/assessments/assessment_service.dart';
import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/services/database/courses/courses_service.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/database_service.dart';

class CoreService extends DatabaseService {
  static DatabaseUser? _user;
  static final CoreService _instance = CoreService._singleton();
  final AssessmentService _assesmentService;
  final CoursesService _coursesService;

  CoreService._singleton()
      : _assesmentService = AssessmentService(),
        _coursesService = CoursesService(),
        super(userTableName);

  factory CoreService() => _instance;

  AssessmentService get assignmentsService => _assesmentService;
  CoursesService get coursesService => _coursesService;

  static DatabaseUser getCurrentUser() {
    if (_user == null) {
      throw UserNotFoundException();
    }
    return _user!;
  }

  @override
  DatabaseUser mapRowToModel(Map<String, Object?> row) {
    return DatabaseUser.fromRow(row);
  }

  //CRUD Functions
  Future<DatabaseUser> createUser({required String email}) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();

    final result = await database.query(
      userTableName,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      throw ExistingUserException();
    }

    final row = {
      'email': email,
    };
    final userId = await insertRecord(row);

    if (userId == 0) {
      throw UnableToCreateUserException();
    }

    return DatabaseUser(id: userId, email: email);
  }

  Future<DatabaseUser> getUser({required String email}) async {
    await checkDbIsOpen();
    final database = fetchOrCreateDatabase();

    final results = await database.query(
      userTableName,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email],
    );

    if (results.isEmpty) {
      throw UserNotFoundException();
    }

    return DatabaseUser.fromRow(results.first);
  }

  Future<DatabaseUser> getOrCreateUser(
      {required String email, bool shouldSetCurrentUser = true}) async {
    try {
      final user = await getUser(email: email);
      if (shouldSetCurrentUser) {
        _user = user;
      }

      return user;
    } on UserNotFoundException {
      final user = await createUser(email: email);
      if (shouldSetCurrentUser) {
        _user = user;
      }

      return user;
    }
  }

  @override
  void dispose() {
    _assesmentService.dispose();
    _closeDB();
  }
}
