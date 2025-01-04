import 'dart:async';

import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/services/database/classes/cache_stream.dart';
import 'package:assignmenttrackerapp/services/database/classes/db_assignment.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:assignmenttrackerapp/services/database/database_service.dart';

class AssignmentsService extends DatabaseService<DatabaseAssignment> {
  CacheStream<DatabaseAssignment> cache = CacheStream<DatabaseAssignment>();

  AssignmentsService() : super(assignmentTableName);

  //CRUD functions
  Future<DatabaseAssignment> updateAssignment(
      {required DatabaseAssignment originalAssignment,
      required DateTime dueDate,
      required String title}) async {
    await getAssignmentUsingId(id: originalAssignment.id);

    final updatedRow = {
      'due_date': dueDate.millisecondsSinceEpoch,
      'title': title
    };

    final count = await updateRecord(originalAssignment.id, updatedRow);

    if (count == 0) {
      throw CouldNotUpdateAssignment();
    }

    final updatedAssignment =
        await getAssignmentUsingId(id: originalAssignment.id);

    cache.updateCache(updatedAssignment);

    return updatedAssignment;
  }

  Future<List<DatabaseAssignment>> getAllAssignments() async {
    final allAssignments = await getAllRecords();

    for (DatabaseAssignment assignment in allAssignments) {
      cache.updateCache(assignment);
    }

    return allAssignments;
  }

  Future<int> deleteAllAssignments() async {
    final count = await deleteAllRecords();

    cache.clearCache();

    return count;
  }

  Future<DatabaseAssignment> getAssignmentUsingId({required int id}) async {
    final results = await getRecordById(id);

    if (results.isEmpty) {
      throw CouldNotFindAssignment();
    }

    final assignment = DatabaseAssignment.fromRow(results.first);

    cache.updateCache(assignment);

    return assignment;
  }

  Future<DatabaseAssignment> createAssignment(
      {required int userId,
      required DateTime dueDate,
      required String title}) async {
    final creationDate = DateTime.now().millisecondsSinceEpoch;
    final row = {
      'user_id': userId,
      'creation_date': creationDate,
      'due_date': dueDate.millisecondsSinceEpoch,
      'title': title
    };

    final assignmentId = await insertRecord(row);
    final assignment = DatabaseAssignment(
      id: assignmentId,
      userId: userId,
      creationDate: DateTime.fromMillisecondsSinceEpoch(creationDate),
      dueDate: dueDate,
      title: title,
    );

    cache.updateCache(assignment);

    return assignment;
  }

  Future<void> deleteAssignment({required int id}) async {
    final count = await deleteRecord(id);

    if (count != 1) {
      throw CouldNotDeleteAssignment();
    }

    cache.removeFromCacheUsingId(id);
  }

  @override
  DatabaseAssignment mapRowToModel(Map<String, Object?> row) {
    return DatabaseAssignment.fromRow(row);
  }
}
