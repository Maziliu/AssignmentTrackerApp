class DatabaseAssignment {
  final int _id, _userId;
  final DateTime _creationDate, _dueDate;
  final String _title;

  DatabaseAssignment({
    required int id,
    required int userId,
    required DateTime creationDate,
    required DateTime dueDate,
    required String title,
  })  : _title = title,
        _dueDate = dueDate,
        _creationDate = creationDate,
        _userId = userId,
        _id = id;

  DatabaseAssignment.fromRow(Map<String, Object?> row)
      : _id = row['id'] as int,
        _userId = row['user_id'] as int,
        _creationDate = row['creation_date'] as DateTime,
        _dueDate = row['due_date'] as DateTime,
        _title = row['title'] as String;

  int get id => _id;
  int get userId => _userId;
  DateTime get creationDate => _creationDate;
  DateTime get dueDate => _dueDate;
  String get title => _title;

  @override
  String toString() {
    return 'ID: $_id USERID: $_userId';
  }

  @override
  bool operator ==(covariant DatabaseAssignment other) {
    return _id == other._id;
  }

  @override
  int get hashCode => _id.hashCode;
}
