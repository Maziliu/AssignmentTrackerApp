import 'package:assignmenttrackerapp/data/local_database/drift/dependency_injection/drift_dependencies.dart';
import 'package:assignmenttrackerapp/presentation/dependency_injection/view_model_dependencies.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

void setupDependencies() {
  injector.registerLazySingleton<AuthServices>(() => AuthServices.firebase());

  setupViewModelDependencies(injector: injector);
  setupDriftDependencies(injector: injector);
}
