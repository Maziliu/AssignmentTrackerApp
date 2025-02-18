import 'dart:io';

abstract class ImportOrchestrator {
  Future<void> importDataFromText({required File file});
}
