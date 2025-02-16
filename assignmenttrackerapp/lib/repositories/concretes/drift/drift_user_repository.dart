import 'package:assignmenttrackerapp/database/DAOs/drift/drift_user_dao.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/models/app_model_course.dart';
import 'package:assignmenttrackerapp/models/app_model_user.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/drift_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/user_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

class DriftUserRepository implements UserRepository, DriftRepository {
  final DriftUserDao _driftUserDao;

  DriftUserRepository({required DriftUserDao driftUserDao})
      : _driftUserDao = driftUserDao;

  @override
  Future<Result<void>> createUser({required AppModelUser user}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteUserById({required int id}) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  AppModelCourse fromDriftDataClass(DataClass driftDataClass) {
    return AppModelCourse(
        id: id,
        userId: userId,
        scheduleBitMask: scheduleBitMask,
        gradedComponent: gradedComponent,
        gradeScale: gradeScale,
        courseName: courseName,
        courseCode: courseCode,
        timeSlot: timeSlot,
        additionalCourseEvents: additionalCourseEvents);
  }

  @override
  Future<Result<AppModelUser>> getUserById({required int id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  UpdateCompanion toDriftCompanion(AppModel model) {
    // TODO: implement toDriftCompanion
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateUser({required AppModelUser user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
