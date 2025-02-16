import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';

class AppModelGradedComponent extends AppModel {
  final double? _weightDecimal;
  final double _gradePercentage;
  final String _gradeLetter, _userId;

  AppModelGradedComponent(
      {required super.id,
      required double? weightDecimal,
      required double gradePercentage,
      required String gradeLetter,
      required String userId})
      : _weightDecimal = weightDecimal,
        _gradePercentage = gradePercentage,
        _gradeLetter = gradeLetter,
        _userId = userId;

  double? get weightDecimal => _weightDecimal;
  double get gradePercentage => _gradePercentage;
  String get gradeLetter => _gradeLetter;
  String get ownerId => _userId;
}
