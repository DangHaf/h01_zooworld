import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/services/share_service/share_service.dart';
import 'package:template/data/export/data_export.dart';
import 'package:template/data/repositories/account_repository.dart';
import 'package:template/data/repositories/address_repository.dart';
import 'package:template/data/repositories/auth_repository.dart';
import 'package:template/data/repositories/file_download_repositories.dart';
import 'package:template/data/repositories/lookup_repository.dart';
import 'package:template/data/repositories/provider_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper(sharedPreferences));
  sl.registerSingleton<LoggingInterceptor>(LoggingInterceptor());

  /// Local Notification.
  sl.registerSingleton<LocalNotificationAPI>(LocalNotificationAPI());

  /// Image upload.
  sl.registerLazySingleton(() => ImageUploadRepository());

  /// download file.
  sl.registerLazySingleton(() => FileDownloadRepository());


  sl.registerLazySingleton(() => Connectivity());

  // Core
  sl.registerSingleton<DioClient>(DioClient());

  // Socket IO.
  sl.registerLazySingleton<SocketIO>(() => SocketIO());


  // Convert.
  sl.registerLazySingleton<ConvertFileToTextRepository>(() => ConvertFileToTextRepository());

  // Share service
  sl.registerLazySingleton<ShareService>(() => ShareService());

  // Auth
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  sl.registerLazySingleton<AccountRepository>(() => AccountRepository());
  sl.registerLazySingleton<LookupRepository>(() => LookupRepository());
  sl.registerLazySingleton<AddressRepository>(() => AddressRepository());
  sl.registerLazySingleton<ProviderRepository>(() => ProviderRepository());
}
