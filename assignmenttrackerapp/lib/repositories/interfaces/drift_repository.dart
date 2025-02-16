import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';
import 'package:drift/drift.dart';

abstract class DriftRepository {
  AppModel fromDriftDataClass(DataClass driftDataClass);
  UpdateCompanion toDriftCompanion(AppModel model);
}
