import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_course_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/common/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_course.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/course_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:drift/drift.dart';

class DriftCourseRepository implements CourseRepository, DriftRepository {
  final DriftCourseDao _driftCourseDao;

  DriftCourseRepository({required DriftCourseDao driftCourseDao})
      : _driftCourseDao = driftCourseDao;

  @override
  Future<Result<void>> createCourse({required AppModelCourse course}) async {
    try {
      await _driftCourseDao.insertCourseByCompanion(toDriftCompanion(course));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateCourseException());
    }
  }

  @override
  Future<Result<void>> deleteCourseById({required int id}) async {
    try {
      await _driftCourseDao.deleteCourseById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteCourseException());
    }
  }

  @override
  AppModelCourse fromDriftDataClass(DataClass driftDataClass) {
    Course course = driftDataClass as Course;
    return AppModelCourse(
      id: course.id,
      userId: course.userId,
      courseName: course.courseName,
      courseCode: course.courseCode,
      scheduleBitMask: course.scheduleBitMask,
      gradedComponentId: course.gradedComponentId,
      gradeScaleId: course.gradeScaleId,
      eventId: course.eventId,
    );
  }

  @override
  Future<Result<AppModelCourse>> getCourseById({required int id}) async {
    try {
      Course? course = await _driftCourseDao.getCourseById(id);
      return (course == null)
          ? Result.error(UnableToFindCourseException())
          : Result.ok(fromDriftDataClass(course));
    } on Exception {
      return Result.error(UnableToFindCourseException());
    }
  }

  @override
  CoursesCompanion toDriftCompanion(AppModel model) {
    AppModelCourse course = model as AppModelCourse;
    return CoursesCompanion(
      id: Value(course.id),
      userId: Value(course.ownerId),
      courseName: Value(course.courseName),
      courseCode: Value(course.courseCode),
      scheduleBitMask: Value(course.scheduleBitMask),
      gradedComponentId: Value(course.gradedComponentId),
      gradeScaleId: Value(course.gradeScaleId),
      eventId: Value(course.eventId),
    );
  }

  @override
  Future<Result<void>> updateCourse({required AppModelCourse course}) async {
    try {
      await _driftCourseDao.updateCourseByCompanion(toDriftCompanion(course));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateCourseException());
    }
  }
}
