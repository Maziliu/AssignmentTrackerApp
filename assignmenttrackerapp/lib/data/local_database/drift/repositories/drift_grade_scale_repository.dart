import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_grade_scale_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/common/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_grade_scale.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/grade_scale_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:drift/drift.dart';

class DriftGradeScaleRepository
    implements GradeScaleRepository, DriftRepository {
  final DriftGradeScaleDao _driftGradeScaleDao;

  DriftGradeScaleRepository({required DriftGradeScaleDao driftGradeScaleDao})
      : _driftGradeScaleDao = driftGradeScaleDao;

  @override
  Future<Result<void>> createGradeScale(
      {required AppModelGradeScale gradeScale}) async {
    try {
      await _driftGradeScaleDao
          .insertGradeScaleByCompanion(toDriftCompanion(gradeScale));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateGradeScaleException());
    }
  }

  @override
  Future<Result<void>> deleteGradeScaleById({required int id}) async {
    try {
      await _driftGradeScaleDao.deleteGradeScaleById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteGradeScaleException());
    }
  }

  @override
  AppModelGradeScale fromDriftDataClass(DataClass driftDataClass) {
    GradeScale gradeScale = driftDataClass as GradeScale;
    return AppModelGradeScale(
        id: gradeScale.id,
        thresholdsJson: gradeScale.thresholdsJson,
        userId: gradeScale.userId);
  }

  @override
  Future<Result<AppModelGradeScale>> getGradeScaleById(
      {required int id}) async {
    try {
      GradeScale? gradeScale = await _driftGradeScaleDao.getGradeScaleById(id);
      return (gradeScale == null)
          ? Result.error(UnableToFindGradeScaleException())
          : Result.ok(fromDriftDataClass(gradeScale));
    } on Exception {
      return Result.error(UnableToFindGradeScaleException());
    }
  }

  @override
  GradeScalesCompanion toDriftCompanion(AppModel model) {
    AppModelGradeScale gradeScale = model as AppModelGradeScale;
    return GradeScalesCompanion(
        id: (gradeScale.id == null) ? Value.absent() : Value(gradeScale.id!),
        userId: Value(gradeScale.ownerId),
        thresholdsJson: Value(gradeScale.thresholdsJson));
  }

  @override
  Future<Result<void>> updateGradeScale(
      {required AppModelGradeScale gradeScale}) async {
    try {
      await _driftGradeScaleDao
          .updateGradeScaleByCompanion(toDriftCompanion(gradeScale));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateGradeScaleException());
    }
  }
}
