import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:assignmenttrackerapp/models/db_user.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:assignmenttrackerapp/services/database/database_service.dart';

class CoreService extends DatabaseService {
  static DatabaseUser? _user;
  static final CoreService _instance = CoreService._singleton();
  final AssignmentsService _assignmentsService;

  CoreService._singleton()
      : _assignmentsService = AssignmentsService(),
        super(userTableName);

  factory CoreService() => _instance;

  AssignmentsService get assignmentsService => _assignmentsService;

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

  void dispose() {
    _assignmentsService.dispose();
    closeDB();
  }

  //CRUD Functions
  Future<DatabaseUser> createUser({required String email}) async {
    await checkDbIsOpen();
    final database = getDatabase();

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
    final database = getDatabase();

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
}
