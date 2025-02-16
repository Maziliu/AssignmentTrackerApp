import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/interfaces/datastreamable.dart';
import 'package:assignmenttrackerapp/models/app_model_assessment.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/crud_service.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/database_service.dart';
import 'package:assignmenttrackerapp/services/database/abstracts/datastream_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AssessmentService extends DatabaseService
    implements CrudService, DatastreamService {
  static final AssessmentService _instance = AssessmentService._singleton();
  static final CacheStream<AppModelAssessment> _cache =
      CacheStream<AppModelAssessment>();

  AssessmentService._singleton() : super(assessmentTableName);

  factory AssessmentService() => _instance;

  @override
  AppModelAssessment mapRowToModel(Map<String, Object?> row) {
    return AppModelAssessment.fromRow(row);
  }

  //CRUD functions
  @override
  Future<AppModelAssessment> createObject(Map<String, Object?> row) async {
    int assesmentId = await insertRecord(row);
    row['id'] = assesmentId;

    return AppModelAssessment.fromRow(row);
  }

  @override
  Future<void> deleteObjectBySpecifications(
      Map<String, Object?> specifications) async {
    await deleteRecordById(specifications['id'] as int);
  }

  @override
  Future<List<AppModelAssessment>> retreiveObjectBySpecifications(
      Map<String, Object?> specifications) async {
    return await getRecordBySpecifications(specifications)
        as List<AppModelAssessment>;
  }

  @override
  Future<AppModelAssessment> updateObject(Map<String, Object?> row) async {
    await updateRecordById(row['id'] as int, row);
    return AppModelAssessment.fromRow(row);
  }

  @override
  CacheStream<DatastreamObject> get cache => _cache;

  @override
  void dispose() {
    _cache.dispose();
  }
}
