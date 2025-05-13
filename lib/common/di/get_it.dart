import '../../data/api/api_service.dart';
import '../../data/api/safe_api_caller.dart';
import '../../data/repo/local_data_repo.dart';
import '../../presentation/lang/lang_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> di() async {
  const tempToken = "ljdf;askj";
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tempToken',
      },
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );

    return dio;
  });

  final sharedPrefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();

  // common
  getIt.registerLazySingleton<APIService>(() => APIService(getIt()));
  getIt.registerLazySingleton<SafeAPICaller>(() => SafeAPICaller());

  // repos:
  getIt.registerLazySingleton<LocalDataRepo>(
    () => LocalDataRepo(sharedPrefs: sharedPrefs, storage: storage),
  );


  // cubits:
  getIt.registerFactory<LangCubit>(() => LangCubit(getIt()));
}
