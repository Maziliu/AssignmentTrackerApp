import 'package:assignmenttrackerapp/database/DAOs/drift/drift_assessment_dao.dart';
import 'package:assignmenttrackerapp/database/DAOs/drift/drift_course_dao.dart';
import 'package:assignmenttrackerapp/database/DAOs/drift/drift_event_dao.dart';
import 'package:assignmenttrackerapp/database/DAOs/drift/drift_grade_scale_dao.dart';
import 'package:assignmenttrackerapp/database/DAOs/drift/drift_graded_component_dao.dart';
import 'package:assignmenttrackerapp/database/DAOs/drift/drift_timeslot_dao.dart';
import 'package:assignmenttrackerapp/database/DAOs/drift/drift_user_dao.dart';
import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _setupDriftDependencies();
}

void _setupDriftDependencies() {
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
}
