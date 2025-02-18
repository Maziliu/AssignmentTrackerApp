import 'package:assignmenttrackerapp/data/local_database/drift/tables/user_table.dart';
import 'package:drift/drift.dart';

class GradeScales extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id, onDelete: KeyAction.cascade)();
  TextColumn get thresholdsJson => text()();
}
