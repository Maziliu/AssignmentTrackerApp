abstract class DatabaseObject {
  final int _ownerId;

  DatabaseObject({required ownerId}) : _ownerId = ownerId;

  int get ownerId => _ownerId;
}
