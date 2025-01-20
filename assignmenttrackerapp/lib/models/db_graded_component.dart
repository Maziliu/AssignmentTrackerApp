import 'package:assignmenttrackerapp/models/db_object.dart';

class DatabaseGradedComponent extends DatabaseObject {
  final double? _weightDecimal;
  final double _gradePercentage;
  final String _gradeLetter;

  DatabaseGradedComponent(
      {required super.id,
      required double weightDecimal,
      required double gradePercentage,
      required String gradeLetter})
      : _weightDecimal = weightDecimal,
        _gradePercentage = gradePercentage,
        _gradeLetter = gradeLetter;

  DatabaseGradedComponent.fromRow(Map<String, Object?> row)
      : _weightDecimal = row['weightDecimal'] as double?,
        _gradePercentage = row['grade_percentage'] as double,
        _gradeLetter = row['grade_letter'] as String,
        super(id: row['id'] as int);

  double? get weightDecimal => _weightDecimal;
  double get gradePercentage => _gradePercentage;
  String get gradeLetter => _gradeLetter;
}
