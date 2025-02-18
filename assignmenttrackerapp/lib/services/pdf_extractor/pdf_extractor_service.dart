import 'dart:io';

abstract class PDFExtractorService {
  Future<String> extractTextFromPdf({required File pdfFile});
}
