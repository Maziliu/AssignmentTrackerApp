import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/sqlite_base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/grade_scale_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteGradeScaleRepository extends SqliteBaseRepository
    implements GradeScaleRepository {
  @override
  Future<void> deleteGradeScaleById({required int id}) async {
    try {
      await deleteDatabaseEntryById(tableName: gradeScaleTableName, rowId: id);
    } on UnableToDeleteDatabaseEntryException {
      throw UnableToDeleteGradeScaleException();
    }
  }

  @override
  Future<DatabaseGradeScale> findGradeScaleById({required int id}) async {
    Database database = await fetchOrCreateDatabase();

    List<Map<String, Object?>> result = await database
        .query(gradeScaleTableName, limit: 1, where: 'id = ?', whereArgs: [id]);

    if (result.isEmpty) throw UnableToFindGradeScaleException();

    return DatabaseGradeScale.fromRow(result.first);
  }

  @override
  Future<void> insertGradeScale({required Map<String, Object?> values}) async {
    try {
      await insertDatabaseEntry(tableName: gradeScaleTableName, row: values);
    } on UnableToInsertDatabaseEntryException {
      throw UnableToInsertGradeScaleException();
    }
  }

  @override
  Future<DatabaseGradeScale> updateGradeScaleById(
      {required int id, required Map<String, Object?> updatedValues}) async {
    try {
      await updateDatabaseEntryById(
          tableName: gradeScaleTableName,
          rowId: id,
          updatedValues: updatedValues);
    } on UnableToUpdateDatabaseEntryException {
      throw UnableToUpdateGradeScaleException();
    }

    return await findGradeScaleById(id: id);
  }
}
