import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';

class DatabaseGradeScale extends DatabaseObject {
  static final Map<String, String> gradeTranslationMap = {
    "a_plus_min": 'A+',
    "a_min": 'A',
    "a_minus_min": 'A-',
    "b_plus_min": 'B+',
    "b_min": 'B',
    "b_minus_min": 'B-',
    "c_plus_min": 'C+',
    "c_min": 'C',
    "c_minus_min": 'C-',
    "d_plus_min": 'D+',
    "d_min": 'D',
  };

  final Map<String, int> _scale;

  DatabaseGradeScale({required super.id, required Map<String, int> scale})
      : _scale = scale;

  DatabaseGradeScale.fromRow(Map<String, Object?> row)
      : _scale = row['_scale'] as Map<String, int>,
        super(id: row['id'] as int);

  Map<String, int> get scale => _scale;
}
