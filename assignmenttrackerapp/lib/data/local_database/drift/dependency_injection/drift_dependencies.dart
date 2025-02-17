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
import 'package:get_it/get_it.dart';

void setupDriftDependencies({required GetIt getIt}) {
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  //DAOS
  getIt.registerLazySingleton<DriftAssessmentDao>(
      () => DriftAssessmentDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<DriftCourseDao>(
      () => DriftCourseDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<DriftEventDao>(
      () => DriftEventDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<DriftGradeScaleDao>(
      () => DriftGradeScaleDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<DriftGradedComponentDao>(
      () => DriftGradedComponentDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<DriftTimeslotDao>(
      () => DriftTimeslotDao(getIt<AppDatabase>()));
  getIt.registerLazySingleton<DriftUserDao>(
      () => DriftUserDao(getIt<AppDatabase>()));

  //Repos
  getIt.registerLazySingleton(() => DriftGradedComponentRepository(
      driftGradedComponentDao: getIt<DriftGradedComponentDao>()));
  getIt.registerLazySingleton(() => DriftAssessmentRepository(
      driftAssessmentDao: getIt<DriftAssessmentDao>()));
  getIt.registerLazySingleton(
      () => DriftCourseRepository(driftCourseDao: getIt<DriftCourseDao>()));
  getIt.registerLazySingleton(() =>
      DriftTimeslotRepository(driftTimeslotDao: getIt<DriftTimeslotDao>()));
  getIt.registerLazySingleton(() => DriftGradeScaleRepository(
      driftGradeScaleDao: getIt<DriftGradeScaleDao>()));
  getIt.registerLazySingleton(
      () => DriftUserRepository(driftUserDao: getIt<DriftUserDao>()));
  getIt.registerLazySingleton(
      () => DriftEventRepository(driftEventDao: getIt<DriftEventDao>()));
}
