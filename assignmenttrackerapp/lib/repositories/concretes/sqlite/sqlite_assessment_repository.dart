import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_assesment.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/models/db_time_slot.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/assessment_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/graded_component_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/time_slot_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteAssessmentRepository extends BaseRepository implements AssessmentRepository {
  final GradedComponentRepository _gradedComponentRepository;
  final TimeSlotRepository _timeSlotRepository;

  SqliteAssessmentRepository({required GradedComponentRepository gradedComponentRepository, required TimeSlotRepository timeSlotRepository}) : _gradedComponentRepository = gradedComponentRepository, _timeSlotRepository = timeSlotRepository;

  @override
  Future<void> deleteAssessmentById({required int id})async {
    try {
      await deleteDatabaseEntryById(tableName: assessmentTableName, rowId: id);
    } on UnableToDeleteDatabaseEntryException {
      throw UnableToDeleteAssessmentException();
    }
  }

  @override
  Future<DatabaseAssesment> findAssessmentById({required int id})async {
    
    final Database database = await getDatabaseInstance();
    final List<Map<String, Object?>> result = await database.query(assessmentTableName, limit: 1, where: 'id = ?', whereArgs: [id]);
    
    if(result.isEmpty) throw UnableToFindAssessmentException();

    final Map<String,Object?> assessmentResult = result.first;
    final DatabaseGradedComponent gradedComponent = await _gradedComponentRepository.findGradedComponentById(id: assessmentResult['graded_component_id'] as int);
    final List<DatabaseTimeSlot> timeSlot = await _timeSlotRepository.findTimeSlotsByReferenceId(referenceId: id);

    final Map<String, Object?> completeAssessmentRow = {...assessmentResult, ...{'gradedComponent' : gradedComponent, 'timeSlot' : timeSlot},};
    
    return DatabaseAssesment.fromRow(completeAssessmentRow);
  }

  @override
  Future<void> insertAssessment({required Map<String, Object?> assessmentValues, required Map<String, Object?> gradedComponentValues, required Map<String, Object?> timeSlotValues})async {
    try {
      await insertDatabaseEntry(tableName: assessmentTableName, row: assessmentValues);
    } on UnableToInsertDatabaseEntryException {
      throw UnableToInsertAssessmentException();
    }

    await _gradedComponentRepository.insertGradedComponent(values: gradedComponentValues);
    await _timeSlotRepository.insertTimeSlot(values: timeSlotValues);
  }

  @override
  Future<DatabaseAssesment> updateAssessmentById({required int assessmentId, required int? gradedComponentId, required int? timeSlotId, required Map<String, Object?> updatedAssessmentValues, required Map<String, Object?>? updatedGradedComponentValues, required Map<String, Object?>? updatedTimeSlotValues})async {
    try {
      await updateDatabaseEntryById(tableName: assessmentTableName, rowId: assessmentId, updatedValues: updatedAssessmentValues);
    } on UnableToUpdateDatabaseEntryException {
      throw UnableToUpdateAssessmentException();
    }

    if(gradedComponentId != null) {
      await _gradedComponentRepository.updateGradedComponentById(id: gradedComponentId, updatedValues: updatedGradedComponentValues!);
    }

    if(timeSlotId != null) {
      await _timeSlotRepository.updateTimeSlotById(id: timeSlotId, updatedValues: updatedTimeSlotValues!);
    }

    return await findAssessmentById(id: assessmentId);
  }

}