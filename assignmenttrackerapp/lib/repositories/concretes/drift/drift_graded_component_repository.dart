import 'package:assignmenttrackerapp/database/DAOs/drift/drift_graded_component_dao.dart';
import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/models/app_model_graded_component.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/drift_repository.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/graded_component_repository.dart';
import 'package:assignmenttrackerapp/utils/result.dart';
import 'package:drift/drift.dart';

class DriftGradedComponentRepository
    implements GradedComponentRepository, DriftRepository {
  final DriftGradedComponentDao _driftGradedComponentDao;

  DriftGradedComponentRepository(
      {required DriftGradedComponentDao gradedComponentDao})
      : _driftGradedComponentDao = gradedComponentDao;

  @override
  Future<Result<void>> createGrDatabaseGradedComponent(
      {required AppModelGradedComponent gradedComponent}) async {
    try {
      await _driftGradedComponentDao
          .insertGradedComponentByCompanion(toDriftCompanion(gradedComponent));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateGradedComponentException());
    }
  }

  @override
  Future<Result<void>> deleteGrDatabaseGradedComponentById(
      {required int id}) async {
    try {
      await _driftGradedComponentDao.deleteGradedComponentById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteGradedComponentException());
    }
  }

  @override
  AppModelGradedComponent fromDriftDataClass(DataClass driftDataClass) {
    GradedComponent gradedComponent = driftDataClass as GradedComponent;
    return AppModelGradedComponent(
      id: gradedComponent.id,
      weightDecimal: gradedComponent.weightDecimal,
      gradePercentage: gradedComponent.gradePercentage,
      gradeLetter: gradedComponent.gradeLetter,
      userId: gradedComponent.userId,
    );
  }

  @override
  Future<Result<AppModelGradedComponent>> getGrDatabaseGradedComponentById(
      {required int id}) async {
    try {
      GradedComponent? gradedComponent =
          await _driftGradedComponentDao.getGradedComponentById(id);
      return (gradedComponent == null)
          ? Result.error(UnableToFindGradedComponentException())
          : Result.ok(fromDriftDataClass(gradedComponent));
    } on Exception {
      return Result.error(UnableToFindGradedComponentException());
    }
  }

  @override
  GradedComponentsCompanion toDriftCompanion(AppModel model) {
    AppModelGradedComponent gradedComponent = model as AppModelGradedComponent;
    return GradedComponentsCompanion(
      id: Value(gradedComponent.id),
      userId: Value(gradedComponent.ownerId),
      weightDecimal: Value(gradedComponent.weightDecimal ?? 0),
      gradeLetter: Value(gradedComponent.gradeLetter),
      gradePercentage: Value(gradedComponent.gradePercentage),
    );
  }

  @override
  Future<Result<void>> updateGrDatabaseGradedComponent(
      {required AppModelGradedComponent gradedComponent}) async {
    try {
      await _driftGradedComponentDao
          .updateGradedComponentByCompanion(toDriftCompanion(gradedComponent));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateGradedComponentException());
    }
  }
}
