import 'package:assignmenttrackerapp/data/models/app_model_assessment.dart';
import 'package:assignmenttrackerapp/data/models/app_model_course.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/assessment_repository.dart';
import 'package:assignmenttrackerapp/data/repositories/interfaces/course_repository.dart';

class CourseAssessmentRepositoryService {
  final CourseRepository _courseRepository;
  final AssessmentRepository _assessmentRepository;

  CourseAssessmentRepositoryService({required CourseRepository courseRepository, required AssessmentRepository assessmentRepository})
      : _courseRepository = courseRepository,
        _assessmentRepository = assessmentRepository;

  Future<void> processCourses({required List<AppModelCourse> courses}) async {}
  Future<void> processAssessments({required List<AppModelAssessment> assessments}) async {}
}
