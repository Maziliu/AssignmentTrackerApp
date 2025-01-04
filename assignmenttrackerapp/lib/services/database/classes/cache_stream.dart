import 'dart:async';

class CacheStream<K> {
  final List<K> _cachedObjects = [];
  final StreamController _cacheController =
      StreamController<List<K>>.broadcast();

  void updateCache(K item, {isDelete = false}) {
    _cachedObjects.removeWhere((obj) => obj == item);
    if (!isDelete) {
      _cachedObjects.add(item);
    }
    _cacheController.add(_cachedObjects);
  }

  void removeFromCacheUsingId(int id) {
    _cachedObjects.removeWhere((obj) => obj.hashCode == id.hashCode);
    _cacheController.add(_cachedObjects);
  }

  void clearCache() {
    _cachedObjects.clear();
    _cacheController.add(_cachedObjects);
  }

  List<K> get cachedObjects => _cachedObjects;
  Stream get cacheStream => _cacheController.stream;
}
