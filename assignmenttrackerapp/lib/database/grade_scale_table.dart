import 'package:drift/drift.dart';

class GradeScaleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get thresholdsJson => text()();
}
