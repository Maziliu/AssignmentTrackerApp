import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_assessment_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_course_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_event_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_grade_scale_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_graded_component_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_timeslot_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_user_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_assessment_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_course_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_event_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_grade_scale_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_graded_component_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_timeslot_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_user_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/assessment_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/course_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/event_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/grade_scale_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/graded_component_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/time_slot_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/user_repository.dart';
import 'package:get_it/get_it.dart';

void setupDriftDependencies({required GetIt injector}) {
  injector.registerSingleton<AppDatabase>(AppDatabase());

  //DAOS
  injector.registerLazySingleton<DriftAssessmentDao>(
      () => DriftAssessmentDao(injector<AppDatabase>()));
  injector.registerLazySingleton<DriftCourseDao>(
      () => DriftCourseDao(injector<AppDatabase>()));
  injector.registerLazySingleton<DriftEventDao>(
      () => DriftEventDao(injector<AppDatabase>()));
  injector.registerLazySingleton<DriftGradeScaleDao>(
      () => DriftGradeScaleDao(injector<AppDatabase>()));
  injector.registerLazySingleton<DriftGradedComponentDao>(
      () => DriftGradedComponentDao(injector<AppDatabase>()));
  injector.registerLazySingleton<DriftTimeslotDao>(
      () => DriftTimeslotDao(injector<AppDatabase>()));
  injector.registerLazySingleton<DriftUserDao>(
      () => DriftUserDao(injector<AppDatabase>()));

  //Repos
  injector.registerLazySingleton<GradedComponentRepository>(() =>
      DriftGradedComponentRepository(
          driftGradedComponentDao: injector<DriftGradedComponentDao>()));
  injector.registerLazySingleton<AssessmentRepository>(() =>
      DriftAssessmentRepository(
          driftAssessmentDao: injector<DriftAssessmentDao>()));
  injector.registerLazySingleton<CourseRepository>(
      () => DriftCourseRepository(driftCourseDao: injector<DriftCourseDao>()));
  injector.registerLazySingleton<TimeSlotRepository>(() =>
      DriftTimeslotRepository(driftTimeslotDao: injector<DriftTimeslotDao>()));
  injector.registerLazySingleton<GradeScaleRepository>(() =>
      DriftGradeScaleRepository(
          driftGradeScaleDao: injector<DriftGradeScaleDao>()));
  injector.registerLazySingleton<UserRepository>(
      () => DriftUserRepository(driftUserDao: injector<DriftUserDao>()));
  injector.registerLazySingleton<EventRepository>(
      () => DriftEventRepository(driftEventDao: injector<DriftEventDao>()));
}
