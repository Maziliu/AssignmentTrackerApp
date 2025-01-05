import 'dart:async';

class CacheStream<K> {
  final List<K> _cachedObjects = [];
  late final StreamController<List<K>> _cacheController;

  CacheStream() {
    _cacheController = StreamController<List<K>>.broadcast(onListen: () {
      _cacheController.sink.add(_cachedObjects);
    });
  }

  void updateCache(K item, {bool isDelete = false}) {
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
  Stream<List<K>> get cacheStream => _cacheController.stream;

  void dispose() {
    _cacheController.close();
  }
}
