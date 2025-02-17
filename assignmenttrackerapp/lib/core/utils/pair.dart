class Pair<K, T> {
  K? first;
  T? second;

  Pair()
      : first = null,
        second = null;

  Pair.pair({required K this.first, required this.second});

  bool get isEmpty => first == null && second == null;
  bool get isNotEmpty => !isEmpty;
}
