import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';

class AppModelGradeScale extends AppModel {
  final String _thresholdsJson, _userId;

  AppModelGradeScale(
      {required super.id,
      required String thresholdsJson,
      required String userId})
      : _thresholdsJson = thresholdsJson,
        _userId = userId;

  String get thresholdsJson => _thresholdsJson;
  String get ownerId => _userId;
}
