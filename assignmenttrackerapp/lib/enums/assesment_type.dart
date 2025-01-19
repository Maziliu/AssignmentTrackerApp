enum AssesmentType {
  quiz,
  exam,
  assignment,
  lab;

  static String get allAssesmentTypes =>
      AssesmentType.values.map((type) => "'${type.name}'").join(", ");
}
