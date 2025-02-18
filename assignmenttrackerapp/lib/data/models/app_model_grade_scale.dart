import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';

class AppModelGradeScale extends AppModel {
  final String _thresholdsJson;
  final int _userId;

  AppModelGradeScale({required super.id, required String thresholdsJson, required int userId})
      : _thresholdsJson = thresholdsJson,
        _userId = userId;

  String get thresholdsJson => _thresholdsJson;
  int get ownerId => _userId;
}
