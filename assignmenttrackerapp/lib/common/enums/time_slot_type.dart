enum TimeSlotType {
  interval,
  deadline,
  tbd;

  static String get allTimeSlotTypes => TimeSlotType.values.map((type) => "'${type.name}'").join(', ');
}
