import 'package:assignmenttrackerapp/data/local_database/drift/dependency_injection/drift_dependencies.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  setupDriftDependencies(getIt: getIt);
}
