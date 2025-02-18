class FailedServicingItemsException implements Exception {
  final String _location, _failure;

  FailedServicingItemsException({required String location, required String failure})
      : _location = location,
        _failure = failure;

  @override
  String toString() {
    return 'Error from $_location: Failed to $_failure';
  }
}
