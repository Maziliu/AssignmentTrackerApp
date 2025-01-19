abstract class CrudService<K> {
  Future<K> createObject(Map<String, Object?> row);
  Future<K> retreiveObjectBySpecifications(Map<String, Object?> specifications);
  Future<List<K>> retreiveAllObjects();
  Future<K> updateObject(Map<String, Object?> row);
  Future<void> deleteObjectBySpecifications(
      Map<String, Object?> specifications);
}
