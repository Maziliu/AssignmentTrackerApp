import 'package:assignmenttrackerapp/data/repositories/interfaces/user_repository.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/auth_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/login/login_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/auth/register/register_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/dashboard/dashboard_view_model.dart';
import 'package:assignmenttrackerapp/presentation/views/schedule/schedule_view_model.dart';
import 'package:assignmenttrackerapp/services/auth/auth_services.dart';
import 'package:assignmenttrackerapp/services/repository_services/schedule_repository_service.dart';
import 'package:get_it/get_it.dart';

void setupViewModelDependencies({required GetIt injector}) {
  injector.registerSingleton<AuthViewModel>(
    AuthViewModel(
      authService: injector<AuthServices>(),
      userRepository: injector<UserRepository>(),
    ),
  );

  injector.registerLazySingleton<DashboardViewModel>(
    () => DashboardViewModel(
      authService: injector<AuthServices>(),
    ),
  );

  injector.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(
      authService: injector<AuthServices>(),
    ),
  );

  injector.registerLazySingleton<RegisterViewModel>(
    () => RegisterViewModel(
      authService: injector<AuthServices>(),
    ),
  );

  injector.registerLazySingleton<ScheduleViewModel>(
    () => ScheduleViewModel(
      userId: injector<AuthViewModel>().userId,
      scheduleRepositoryService: injector<ScheduleRepositoryService>(),
    ),
  );
}
