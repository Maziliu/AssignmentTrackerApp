extension Filter<K> on Stream<List<K>> {
  Stream<List<K>> filter(bool Function(K) where) =>
      map((item) => item.where(where).toList());
}
