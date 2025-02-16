import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/services/database/assessments/assessment_service.dart';
import 'package:assignmenttrackerapp/models/app_model_user.dart';
import 'package:assignmenttrackerapp/services/database/courses/courses_service.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/database_service.dart';

class CoreService extends DatabaseService {
  static AppModelUser? _user;
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

  static AppModelUser getCurrentUser() {
    if (_user == null) {
      throw UserNotFoundException();
    }
    return _user!;
  }

  @override
  AppModelUser mapRowToModel(Map<String, Object?> row) {
    return AppModelUser.fromRow(row);
  }

  //CRUD Functions
  Future<AppModelUser> createUser({required String email}) async {
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

    return AppModelUser(id: userId, email: email);
  }

  Future<AppModelUser> getUser({required String email}) async {
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

    return AppModelUser.fromRow(results.first);
  }

  Future<AppModelUser> getOrCreateUser(
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
