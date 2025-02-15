import 'package:drift/drift.dart';

class GradeScales extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get thresholdsJson => text()();
}
