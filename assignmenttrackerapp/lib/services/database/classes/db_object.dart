abstract class DatabaseObject {
  @override
  bool operator ==(covariant DatabaseObject other);

  @override
  int get hashCode;
}
