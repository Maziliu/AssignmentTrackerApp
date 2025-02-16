import 'package:assignmenttrackerapp/models/abstracts/db_object.dart';
import 'package:drift/drift.dart';

abstract class DriftRepository {
  DatabaseObject fromDriftDataClass(DataClass driftDataClass);
  UpdateCompanion toDriftCompanion(DatabaseObject driftCompanion);
}
