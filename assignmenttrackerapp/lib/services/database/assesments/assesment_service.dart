import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/datastream_object.dart';
import 'package:assignmenttrackerapp/models/db_assesment.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/crud_service.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/database_service.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/datastream_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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
  Future<DatabaseAssesment> createObject(Map<String, Object?> row) async {
    int assesmentId = await insertRecord(row);
    row['id'] = assesmentId;

    return DatabaseAssesment.fromRow(row);
  }

  @override
  Future<void> deleteObjectBySpecifications(
      Map<String, Object?> specifications) async {
    await deleteRecordById(specifications['id'] as int);
  }

  @override
  Future<List<DatabaseAssesment>> retreiveObjectBySpecifications(
      Map<String, Object?> specifications) async {
    return await getRecordBySpecifications(specifications)
        as List<DatabaseAssesment>;
  }

  @override
  Future<DatabaseAssesment> updateObject(Map<String, Object?> row) async {
    await updateRecordById(row['id'] as int, row);
    return DatabaseAssesment.fromRow(row);
  }

  @override
  CacheStream<DatastreamObject> get cache => _cache;

  @override
  void dispose() {
    _cache.dispose();
  }
}
