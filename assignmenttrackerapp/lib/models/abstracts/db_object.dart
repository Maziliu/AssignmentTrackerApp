abstract class DatabaseObject{
  final int _id;

  DatabaseObject({required int id}) : _id = id;

  int get id => _id;
}
