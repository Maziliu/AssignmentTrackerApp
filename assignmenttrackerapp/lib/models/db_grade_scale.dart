import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';

class DatabaseGradeScale extends DatabaseObject {
  final String _thresholdsJson;

  DatabaseGradeScale({required super.id, required String thresholdsJson}) : _thresholdsJson = thresholdsJson;

  String get thresholdsJson => _thresholdsJson; 
}
