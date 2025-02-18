import 'package:assignmenttrackerapp/data/models/app_model_grade_scale.dart';
import 'package:assignmenttrackerapp/data/models/app_model_graded_component.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/grade_scale_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/graded_component_repository.dart';

class GradingRepositoryService {
  final GradeScaleRepository _gradeScaleRepository;
  final GradedComponentRepository _gradedComponentRepository;

  GradingRepositoryService({required GradeScaleRepository gradeScaleRepository, required GradedComponentRepository gradedComponentRepository})
      : _gradeScaleRepository = gradeScaleRepository,
        _gradedComponentRepository = gradedComponentRepository;

  Future<void> processGradeScales({required List<AppModelGradeScale> gradeScales}) async {}
  Future<void> processGradedComponents({required List<AppModelGradedComponent> gradedComponents}) async {}
}
