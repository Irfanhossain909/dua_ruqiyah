import 'package:get_it/get_it.dart';
import '../../presentation/home/presenter/home_presenter.dart';

/// Global ServiceLocator instance
final GetIt serviceLocator = GetIt.instance;

/// Shorthand function to get an instance from the service locator
///
/// Example: final logger = locator<LoggerService>();
T locator<T extends Object>() => serviceLocator<T>();

/// Setup all dependencies for the application
///
/// This should be called before the app starts
Future<void> setupDependencies() async {
  // External Services
  _setupExternalServices();
  
  // Core Services
  _setupCoreServices();
  
  // Data Sources
  _setupDataSources();
  
  // Repositories
  _setupRepositories();
  
  // Use Cases
  _setupUseCases();
  
  // Presenters
  _setupPresenters();
}

void _setupExternalServices() {
  // TODO: Register external services like SharedPreferences, Dio, etc.
  // Example: serviceLocator.registerLazySingleton(() => SharedPreferences.getInstance());
}

void _setupCoreServices() {
  // TODO: Register core services like LoggerService, NetworkService, etc.
  // Example: serviceLocator.registerLazySingleton<LoggerService>(() => LoggerServiceImpl());
}

void _setupDataSources() {
  // TODO: Register data sources
  // Example: serviceLocator.registerLazySingleton<LocationDataSource>(() => LocationDataSourceImpl(serviceLocator()));
}

void _setupRepositories() {
  // TODO: Register repositories
  // Example: serviceLocator.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl(serviceLocator()));
}

void _setupUseCases() {
  // TODO: Register use cases
  // Example: serviceLocator.registerLazySingleton(() => GetCurrentLocationUseCase(serviceLocator()));
}

void _setupPresenters() {
  // Register presenters
  serviceLocator.registerFactory<HomePresenter>(() => HomePresenter());
}

/// Reset all dependencies (useful for testing)
void resetDependencies() {
  serviceLocator.reset();
} 