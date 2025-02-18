abstract class LLMService {
  Future<Map<String, dynamic>> promptAndGetJsonResponse(
      {required String extractedText});
}
