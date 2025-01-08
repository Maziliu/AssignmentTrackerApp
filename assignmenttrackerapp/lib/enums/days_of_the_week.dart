enum DaysOfTheWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday;

  @override
  String toString() {
    String name = super.toString().split('.').last;
    return name[0].toUpperCase() + name.substring(1);
  }
}
