import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sportapp/domain/usecases/get_all_coachs_use_case.dart';
import 'package:sportapp/domain/usecases/get_user_profile_use_case.dart';
import 'package:sportapp/domain/usecases/login_use_case.dart';
import 'package:sportapp/domain/usecases/register_use_case.dart';
import 'package:sportapp/presentation/controllers/coaches_controller.dart';

import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../domain/usecases/update_user_profile_use_case.dart';
import '../../presentation/controllers/language_controller.dart';
import '../../presentation/controllers/auth_controller.dart';
import '../../presentation/controllers/user_controller.dart';
import '../../presentation/controllers/theme_controller.dart';
import '../global_error_handler/global_error_handler.dart';
import '../navigation/navigation_service.dart';
import '../routes/app_routes.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _instance = DependencyInjection._internal();

  factory DependencyInjection() {
    return _instance;
  }

  DependencyInjection._internal();

  Future<void> init() async {
    // ==================================================
    // 1. Infrastructure Dependencies
    // Low-level tools like HTTP clients, databases, and third-party SDKs.
    // ==================================================

    // HTTP Client (e.g., http.Client)
    sl.registerLazySingleton(() => http.Client());

    // GoRouter for navigation
    sl.registerSingleton<GoRouter>(AppRouter.router);

    // SharedPreferences for local storage
    sl.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    sl.registerLazySingleton(() => GlobalErrorHandler());
    // ==================================================
    // 2. Repositories
    // Abstraction layer for data sources.
    // ==================================================

    // RemoteDataSource for API calls
    sl.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl(
      client: sl(),
      prefs: sl(),
    ));

    // AuthRepository to handle authentication-related data
    sl.registerSingleton<AuthRepository>(
        AuthRepositoryImpl(remoteDataSource: sl()));
    sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

    // ==================================================
    // 3. Use Cases
    // Encapsulate specific business logic.
    // ==================================================

    // Use cases for authentication
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<GetUserProfileUseCase>(
        () => GetUserProfileUseCase(sl()));
    sl.registerLazySingleton<UpdateUserProfileUseCase>(
        () => UpdateUserProfileUseCase(sl()));
    sl.registerLazySingleton<GetAllCoachsUseCase>(
        () => GetAllCoachsUseCase(sl()));
    // ==================================================
    // 4. Controllers
    // State and logic for specific features or screens.
    // ==================================================

    // LoginController to manage the login screen's state and logic
    sl.registerLazySingleton<AuthController>(() => AuthController(
          globalErrorHandler: sl(),
          prefs: sl(),
          navigationService: sl(),
          loginUseCase: sl(),
          logoutUseCase: sl(),
          registerUseCase: sl(),
        ));
    // UserController to manage the user profile screen's state and logic
    sl.registerLazySingleton<UserController>(() => UserController(
          globalErrorHandler: sl(),
          getUserProfileUseCase: sl(),
          updateUserProfileUseCase: sl(),
        ));

    sl.registerLazySingleton<CoachesController>(() => CoachesController(
          sl(),
          sl(),
        ));

    sl.registerLazySingleton<LanguageController>(() => LanguageController());
    sl.registerLazySingleton<ThemeController>(
        () => ThemeController(prefs: sl()));
    // ==================================================
    // 5. Services
    // Business logic and interaction with repositories.
    // ==================================================

    // NavigationService to handle app navigation
    sl.registerSingleton<NavigationService>(NavigationService(sl<GoRouter>()));
  }
}
