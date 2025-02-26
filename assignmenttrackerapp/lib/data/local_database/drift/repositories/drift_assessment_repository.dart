import 'package:assignmenttrackerapp/data/local_database/drift/dao/drift_assessment_dao.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/app_database.dart';
import 'package:assignmenttrackerapp/common/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';
import 'package:assignmenttrackerapp/data/models/app_model_assessment.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/assessment_repository.dart';
import 'package:assignmenttrackerapp/data/local_database/drift/repositories/drift_repository.dart';
import 'package:assignmenttrackerapp/common/utils/result.dart';
import 'package:drift/drift.dart';

class DriftAssessmentRepository implements AssessmentRepository, DriftRepository {
  final DriftAssessmentDao _driftAssessmentDao;

  DriftAssessmentRepository({required DriftAssessmentDao driftAssessmentDao}) : _driftAssessmentDao = driftAssessmentDao;

  @override
  Future<Result<void>> createAssessment({required AppModelAssessment assessment}) async {
    try {
      await _driftAssessmentDao.insertAssessmentByCompanion(toDriftCompanion(assessment));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToCreateAssessmentException());
    }
  }

  @override
  Future<Result<void>> deleteAssessmentById({required int id}) async {
    try {
      await _driftAssessmentDao.deleteAssessmentById(id);
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToDeleteAssessmentException());
    }
  }

  @override
  AppModelAssessment fromDriftDataClass(DataClass driftDataClass) {
    Assessment assessment = driftDataClass as Assessment;
    return AppModelAssessment(
      id: assessment.id,
      userId: assessment.userId,
      assessmentName: assessment.assessmentName,
      assessmentType: assessment.type,
      isComplete: assessment.isComplete,
      gradedComponentId: assessment.gradedComponentId,
      eventId: assessment.eventId,
      courseId: assessment.courseId,
    );
  }

  @override
  Future<Result<AppModelAssessment>> getAssessmentById({required int id}) async {
    try {
      Assessment? assessment = await _driftAssessmentDao.getAssessmentById(id);
      return (assessment == null) ? Result.error(FailedToRetrieveAssessmentException()) : Result.ok(fromDriftDataClass(assessment));
    } on Exception {
      return Result.error(FailedToRetrieveAssessmentException());
    }
  }

  @override
  AssessmentsCompanion toDriftCompanion(AppModel model) {
    AppModelAssessment assessment = model as AppModelAssessment;
    return AssessmentsCompanion(
      id: (assessment.id == null) ? Value.absent() : Value(assessment.id!),
      userId: Value(assessment.ownerId),
      courseId: Value(assessment.courseId),
      gradedComponentId: Value(assessment.gradedComponentId),
      eventId: Value(assessment.eventId),
      assessmentName: Value(assessment.assessmentName),
      isComplete: Value(assessment.isComplete),
      type: Value(assessment.assessmentType),
    );
  }

  @override
  Future<Result<void>> updateAssessment({required AppModelAssessment assessment}) async {
    try {
      await _driftAssessmentDao.updateAssessmentByCompanion(toDriftCompanion(assessment));
      return Result.ok(null);
    } on Exception {
      return Result.error(UnableToUpdateAssessmentException());
    }
  }
}
