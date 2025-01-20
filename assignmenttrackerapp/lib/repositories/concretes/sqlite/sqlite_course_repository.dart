import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/repositories/abstracts/sqlite_base_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/course_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/grade_scale_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/graded_component_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/time_slot_repository.dart';
import 'package:sqflite/sqflite.dart';

class SqliteCourseRepository extends SqliteBaseRepository
    implements CourseRepository {
  final GradedComponentRepository _gradedComponentRepository;
  final GradeScaleRepository _gradeScaleRepository;
  final TimeSlotRepository _timeSlotRepository;
  final EventRepository _eventRepository;

  SqliteCourseRepository(
      {required GradedComponentRepository gradedComponentRepository,
      required GradeScaleRepository gradeScaleRepository,
      required TimeSlotRepository timeSlotRepository,
      required EventRepository eventRepository})
      : _gradedComponentRepository = gradedComponentRepository,
        _gradeScaleRepository = gradeScaleRepository,
        _timeSlotRepository = timeSlotRepository,
        _eventRepository = eventRepository;

  @override
  Future<void> deleteCourseById({required int id}) async {
    try {
      await deleteCourseById(id: id);
    } on UnableToDeleteDatabaseEntryException {
      throw UnableToDeleteCourseException();
    }
  }

  @override
  Future<DatabaseCourse> findCourseById({required int id}) async {
    final Database database = await fetchOrCreateDatabase();
    final List<Map<String, Object?>> courseResult = await database
        .query(courseTableName, limit: 1, where: 'id = ?', whereArgs: [id]);

    if (courseResult.isEmpty) throw UnableToFindCourseException();

    final Map<String, Object?> courseComponentIds = {'gradedComponentId' : courseResult.first['graded_component_id'], 'gradeScaleId' : courseResult.first['grade_scale_id'],};

    DatabaseGradedComponent gradedComponent = await _gradedComponentRepository.findGradedComponentById(id: courseComponentIds['gradedComponentId'] as int);
    DatabaseGradeScale gradeScale = await _gradeScaleRepository.findGradeScaleById(id: courseComponentIds['gradeScaleId'] as int);

    final Map<String, Object?> completeCourseRow = {...courseResult.first, ...{'gradedComponent' : gradedComponent, 'gradeScale' : gradeScale},};

    return DatabaseCourse.fromRow(completeCourseRow);
  }

  @override
  Future<void> insertCourse(
      {required Map<String, Object?> courseValues,
      required Map<String, Object?> gradedComponentValues,
      required Map<String, Object?> gradeScaleValues,
      required Map<String, Object?> timeSlotValues,
      required List<Map<String, Object?>>? additionalEventsValues}) async {
    
    try{
      await insertDatabaseEntry(tableName: courseTableName, row: courseValues);
    } on UnableToInsertDatabaseEntryException {
      throw UnableToInsertCourseException();
    }
    await _gradedComponentRepository.insertGradedComponent(values: gradedComponentValues);
    await _gradeScaleRepository.insertGradeScale(values: gradeScaleValues);
    await _timeSlotRepository.insertTimeSlot(values: timeSlotValues);

    if(additionalEventsValues != null) {
      for(Map<String, Object?> event in additionalEventsValues) {
        await _eventRepository.insertEvent(eventValues: event['values'] as Map<String, Object?>, timeSlotValues: event['timeslot'] as Map<String, Object?>);
      }
    } 
  }

  @override
  Future<DatabaseCourse> updateCourseById(
      {required int courseId,
      required int? gradedComponentId,
      required int? gradeScaleId,
      required int? timeSlotId,
      required Map<String, Object?> updatedCourseValues,
      required Map<String, Object?>? updatedGradedComponentValues,
      required Map<String, Object?>? updatedGradeScaleValues,
      required Map<String, Object?>? updatedTimeSlotValues,
      required List<Map<String, Object?>>?
          updatedAdditionalEventsValues}) async {
    
    try{
      await updateDatabaseEntryById(tableName: courseTableName, rowId: courseId, updatedValues: updatedCourseValues);
    } on UnableToUpdateDatabaseEntryException {
      throw UnableToUpdateCourseException();
    }
    
    if(gradedComponentId != null) {
      await updateDatabaseEntryById(tableName: gradedComponentTableName, rowId: gradedComponentId, updatedValues: updatedGradedComponentValues!);
    }

    if(gradeScaleId != null) {
      await updateDatabaseEntryById(tableName: gradeScaleTableName, rowId: gradeScaleId, updatedValues: updatedGradeScaleValues!);
    }

    if(timeSlotId != null) {
      await updateDatabaseEntryById(tableName: timeSlotTableName, rowId: timeSlotId, updatedValues: updatedTimeSlotValues!);
    }

    return await findCourseById(id: courseId);
  }
}
