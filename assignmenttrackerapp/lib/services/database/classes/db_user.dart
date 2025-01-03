class DatabaseUser {
  final int _id;
  final String _email;

  const DatabaseUser({
    required int id,
    required String email,
  })  : _email = email,
        _id = id;

  DatabaseUser.fromRow(Map<String, Object?> row)
      : _id = row['id'] as int,
        _email = row['email'] as String;

  int get id => _id;
  String get email => _email;

  @override
  String toString() {
    return 'ID: $_id, EMAIL: $_email';
  }

  @override
  bool operator ==(covariant DatabaseUser other) {
    return _id == other._id;
  }

  @override
  int get hashCode {
    return _id.hashCode;
  }
}