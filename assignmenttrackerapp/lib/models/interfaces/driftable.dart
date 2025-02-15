import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';
import 'package:drift/drift.dart';

abstract class Driftable {
  DatabaseObject fromDriftData(DataClass dataClass);
  UpdateCompanion toDriftCompanion(DatabaseObject databaseObject);
}
