import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/database/course_table.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/models/db_grade_scale.dart';
import 'package:assignmenttrackerapp/models/db_graded_component.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/course_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/grade_scale_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/graded_component_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/user_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

part '../../../../database/generated/drift_courses_dao.g.dart';

@DriftAccessor(tables: [Courses])
class DriftCoursesDao extends DatabaseAccessor<AppDatabase> with _$DriftCoursesDaoMixin implements CourseRepository{
  final GradeScaleRepository _gradeScaleRepository;
  final GradedComponentRepository _gradedComponentRepository;
  final EventRepository _eventRepository;

  DriftCoursesDao(super.attachedDatabase, {required GradeScaleRepository gradeScaleRepository, required GradedComponentRepository gradedComponentRepository, required EventRepository eventRepository}) : _gradeScaleRepository = gradeScaleRepository, _gradedComponentRepository = gradedComponentRepository, _eventRepository = eventRepository;


  @override
  Future<Result<void>> deleteCourseById({required int id}) async {
    try {
      await (delete(courses)..where((course) => course.id.equals(id))).go();

      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteCourseException());
    }
  }

  @override
  Future<Result<DatabaseCourse>> findCourseById({required int id}) async {
    try {
      final Course? course = await (select(courses)..where((course) => course.id.equals(id))).getSingleOrNull();

      if(course == null) {
        return Result.error(UnableToFindCourseException());
      }

      final Result<DatabaseGradeScale> gradeScaleResult = await _gradeScaleRepository.findGradeScaleById(id: course.gradedScaleId);
      
      final Result<DatabaseGradedComponent> gradedComonentResult = await _gradedComponentRepository.findGradedComponentById(id: course.gradedComponentId);

      final Result<List<DatabaseEvent>> additionalEvents = await _eventRepository.


    } on Exception {
      return Result.error(UnableToFindCourseException());
    }
  }

  @override
  Future<Result<void>> insertCourse({required Map<String, Object?> courseValues, required Map<String, Object?> gradedComponentValues, required Map<String, Object?> gradeScaleValues, required Map<String, Object?> timeSlotValues, required List<Map<String, Object?>>? additionalEventsValues}) {
    // TODO: implement insertCourse
    throw UnimplementedError();
  }

  @override
  Future<Result<DatabaseCourse>> updateCourseById({required int courseId, required int? gradedComponentId, required int? gradeScaleId, required int? timeSlotId, required Map<String, Object?> updatedCourseValues, required Map<String, Object?>? updatedGradedComponentValues, required Map<String, Object?>? updatedGradeScaleValues, required Map<String, Object?>? updatedTimeSlotValues, required List<Map<String, Object?>>? updatedAdditionalEventsValues}) {
    // TODO: implement updateCourseById
    throw UnimplementedError();
  }

  DatabaseCourse _fromCourse(Course course, DatabaseGradedComponent gradedComponent, DatabaseGradeScale gradeScale, List<DatabaseEvent> additionalCourseEvents){
    return DatabaseCourse(id: course.id, userId: course.userId, scheduleBitMask: course.scheduleBitMask, gradedComponent: course.gr, gradeScale: gradeScale, courseName: courseName, courseCode: courseCode, timeSlot: timeSlot, additionalCourseEvents: additionalCourseEvents)
  }

}