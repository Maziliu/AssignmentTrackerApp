import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/crud_service.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/database_service.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/datastream_service.dart';

class CoursesService extends DatabaseService
    implements CrudService, DatastreamService {
  static final CoursesService _instance = CoursesService._singleton();
  static final CacheStream<DatabaseCourse> _cache =
      CacheStream<DatabaseCourse>();

  CoursesService._singleton() : super(courseTableName);

  factory CoursesService() => _instance;

  @override
  CacheStream<DatabaseCourse> get cache => _cache;

  @override
  DatabaseCourse mapRowToModel(Map<String, Object?> row) {
    return DatabaseCourse.fromRow(row);
  }

  @override
  void dispose() {
    _cache.dispose();
  }

  @override
  Future<DatabaseCourse> createObject(Map<String, Object?> row) async {
    final int insertedCourseId = await insertRecord(row);
    row['id'] = insertedCourseId;
    return DatabaseCourse.fromRow(row);
  }

  @override
  Future<void> deleteObjectBySpecifications(
      Map<String, Object?> specifications) async {
    await deleteRecordById(specifications['id'] as int);
  }

  @override
  Future<List<DatabaseCourse>> retreiveObjectBySpecifications(
      Map<String, Object?> specifications) async {
    return await getRecordBySpecifications(specifications)
        as List<DatabaseCourse>;
  }

  @override
  Future<DatabaseCourse> updateObject(Map<String, Object?> row) async {
    await updateRecordById(row['id'] as int, row);
    return DatabaseCourse.fromRow(row);
  }
}
