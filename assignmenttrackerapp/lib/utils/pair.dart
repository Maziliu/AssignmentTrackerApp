class Pair<K, T> {
  final K? _first;
  final T? _second;

  Pair({required K first, required second})
      : _first = first,
        _second = second;

  K? get first => _first;
  T? get second => _second;

  bool get isEmpty => _first == null && _second == null;
}
