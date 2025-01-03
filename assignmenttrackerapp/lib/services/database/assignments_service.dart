import 'dart:async';

import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/services/database/classes/db_assignment.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AssignmentsService {
  Database? _database;

  Database _getDatabase() {
    final database = _database;
    if (database == null) {
      throw DatabaseDoesNotExistException();
    }
    return database;
  }

  Future<void> closeDB() async {
    if (_database == null) {
      throw DatabaseDoesNotExistException();
    }

    await _database?.close();
    _database = null;
  }

  Future<void> openDB() async {
    if (_database != null) {
      throw DatabaseExistsAlreadyException();
    }

    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final databasePath = join(appDocDir.path, databaseName);
      final database = await openDatabase(
          databasePath); //Note: if the db does not exist this will create it; empty with no tables
      _database = database;

      //Create user and assignment tables if it doesnt exist
      await database.execute(createUserTable);
      await database.execute(createAssignmentTable);
    } on MissingPlatformDirectoryException {
      throw DocumentsDirectoryNotFoundException();
    }
  }

  //CRUD functions
  Future<DatabaseAssignment> updateAssignment(
      {required DatabaseAssignment originalAssignment,
      required DateTime dueDate,
      required String title}) async {
    final database = _getDatabase();
    await getAssignmentUsingId(id: originalAssignment.id);

    final updatedRow = {
      'due_date': dueDate.millisecondsSinceEpoch,
      'title': title
    };

    final count = await database.update(assignmentTableName, updatedRow);

    if (count == 0) {
      throw CouldNotUpdateAssignment();
    }

    return DatabaseAssignment(
        id: originalAssignment.id,
        userId: originalAssignment.userId,
        creationDate: originalAssignment.creationDate,
        dueDate: dueDate,
        title: title);
  }

  Future<Iterable<DatabaseAssignment>> getAllAssignments() async {
    final database = _getDatabase();
    final results = await database.query(assignmentTableName);

    return results.map((row) => DatabaseAssignment.fromRow(row));
  }

  Future<int> deleteAllAssignments() async {
    final database = _getDatabase();
    final count = await database.delete(assignmentTableName);

    return count;
  }

  Future<DatabaseAssignment> getAssignmentUsingId({required int id}) async {
    final database = _getDatabase();

    final results = await database.query(
      assignmentTableName,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isEmpty) {
      throw CouldNotFindAssignment();
    }

    return DatabaseAssignment.fromRow(results.first);
  }

  Future<DatabaseAssignment> createAssignment(
      {required int userId,
      required DateTime dueDate,
      required String title}) async {
    final database = _getDatabase();
    final creationDate = DateTime.now().millisecondsSinceEpoch;
    final row = {
      'user_id': userId,
      'creation_date': creationDate,
      'due_date': dueDate.millisecondsSinceEpoch,
      'title': title
    };

    final assignmentId = await database.insert(assignmentTableName, row);

    return DatabaseAssignment(
      id: assignmentId,
      userId: userId,
      creationDate: DateTime.fromMillisecondsSinceEpoch(creationDate),
      dueDate: dueDate,
      title: title,
    );
  }

  Future<void> deleteAssignment({required int id}) async {
    final database = _getDatabase();
    final count = await database.delete(
      assignmentTableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (count != 1) {
      throw CouldNotDeleteAssignment();
    }
  }
}
