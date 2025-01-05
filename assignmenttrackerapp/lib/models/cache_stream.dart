import 'dart:async';

import 'package:assignmenttrackerapp/models/db_object.dart';
import 'package:assignmenttrackerapp/services/database/core_service.dart';
import 'package:assignmenttrackerapp/services/database/stream_filter.dart';

class CacheStream<K extends DatabaseObject> {
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
  Stream<List<K>> get cacheStream => _cacheController.stream.filter((obj) {
        final currentUser = CoreService.getCurrentUser();
        return obj.ownerId == currentUser.id;
      });

  void dispose() {
    _cacheController.close();
  }
}
