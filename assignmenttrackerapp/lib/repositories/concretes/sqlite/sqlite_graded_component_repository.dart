import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/sqlite_base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/graded_component_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteGradedComponentRepository extends SqliteBaseRepository
    implements GradedComponentRepository {
  @override
  Future<void> deleteGradedComponentById({required int id}) async {
    try {
      await deleteDatabaseEntryById(
          tableName: gradedComponentTableName, rowId: id);
    } on UnableToDeleteDatabaseEntryException {
      throw UnableToDeleteGradedComponentException();
    }
  }

  @override
  Future<DatabaseGradedComponent> findGradedComponentById(
      {required int id}) async {
    Database database = await fetchOrCreateDatabase();

    List<Map<String, Object?>> result = await database.query(
        gradedComponentTableName,
        limit: 1,
        where: 'id = ?',
        whereArgs: [id]);

    if (result.isEmpty) throw UnableToFindGradedComponentException();

    return DatabaseGradedComponent.fromRow(result.first);
  }

  @override
  Future<void> insertGradedComponent(
      {required Map<String, Object?> values}) async {
    try {
      await insertDatabaseEntry(
          tableName: gradedComponentTableName, row: values);
    } on UnableToInsertDatabaseEntryException {
      throw UnableToInsertGradedComponentException();
    }
  }

  @override
  Future<DatabaseGradedComponent> updateGradedComponentById(
      {required int id, required Map<String, Object?> updatedValues}) async {
    try {
      await updateGradedComponentById(id: id, updatedValues: updatedValues);
    } on UnableToUpdateDatabaseEntryException {
      throw UnableToUpdateGradedComponentException();
    }
    return findGradedComponentById(id: id);
  }
}
