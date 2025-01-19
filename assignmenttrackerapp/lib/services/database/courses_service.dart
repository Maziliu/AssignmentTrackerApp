import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/services/database/crud_service.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:assignmenttrackerapp/services/database/database_service.dart';
import 'package:assignmenttrackerapp/services/database/datastream_service.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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
}
