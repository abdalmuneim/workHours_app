import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workhours/common/services/network_services.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final SharedPreferences sharedInstance =
      await SharedPreferences.getInstance();

  ///! External
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => sharedInstance);

  /// Use cases
  // sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  // sl.registerLazySingleton(() => IsLoggedInUseCase(sl()));
  // sl.registerLazySingleton(() => IsSignInBeforeUseCase(sl()));
  // sl.registerLazySingleton(() => LogOutUseCase(sl()));
  // sl.registerLazySingleton(() => RegisterUseCase(sl()));
  // sl.registerLazySingleton(() => SignInUseCase(sl()));

  /// Repository
  // sl.registerLazySingleton<IAuthRepository>(() => AuthRepository(localDataSource: sl(), remoteDataSource: sl()));

  /// Data sources
  // sl.registerLazySingleton<IAuthRemoteDataSource>(() => AuthRemoteDataSource());

  /// Local sources
  // sl.registerLazySingleton<IAuthLocalDataSource>(() =>AuthLocalDataSource(flutterSecureStorage: sl(), sharedPreferences: sl()));

  //--------------- services--------------
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
}
