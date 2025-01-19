import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/datastream_object.dart';
import 'package:assignmenttrackerapp/models/db_assesment.dart';
import 'package:assignmenttrackerapp/services/database/crud_service.dart';
import 'package:assignmenttrackerapp/services/database/database_service.dart';
import 'package:assignmenttrackerapp/services/database/datastream_service.dart';

class AssesmentService extends DatabaseService
    implements CrudService, DatastreamService {
  static final AssesmentService _instance = AssesmentService._singleton();
  static final CacheStream<DatabaseAssesment> _cache =
      CacheStream<DatabaseAssesment>();

  AssesmentService._singleton() : super(assesmentTableName);

  factory AssesmentService() => _instance;

  @override
  DatabaseAssesment mapRowToModel(Map<String, Object?> row) {
    return DatabaseAssesment.fromRow(row);
  }

  //CRUD functions
  @override
  Future createObject(Map<String, Object?> row) {
    // TODO: implement createObject
    throw UnimplementedError();
  }

  @override
  Future<void> deleteObjectBySpecifications(
      Map<String, Object?> specifications) {
    // TODO: implement deleteObjectBySpecifications
    throw UnimplementedError();
  }

  @override
  Future<List> retreiveAllObjects() {
    // TODO: implement retreiveAllObjects
    throw UnimplementedError();
  }

  @override
  Future retreiveObjectBySpecifications(Map<String, Object?> specifications) {
    // TODO: implement retreiveObjectBySpecifications
    throw UnimplementedError();
  }

  @override
  Future updateObject(Map<String, Object?> row) {
    // TODO: implement updateObject
    throw UnimplementedError();
  }

  @override
  CacheStream<DatastreamObject> get cache => _cache;

  @override
  void dispose() {
    _cache.dispose();
  }
}
