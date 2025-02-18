enum AssessmentType {
  quiz,
  exam,
  assignment,
  lab;

  static String get allAssesmentTypes => AssessmentType.values.map((type) => "'${type.name}'").join(', ');
}
