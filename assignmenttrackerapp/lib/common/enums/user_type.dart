enum UserType {
  local,
  cloud;

  static String get allUserTypes => UserType.values.map((type) => "'${type.name}'").join(', ');
}
