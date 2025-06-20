import 'package:aqar_go/data/repo/auth_repo.dart';
import 'package:aqar_go/data/repo/property_repo_impl.dart';
import 'package:aqar_go/presentation/feature/auth/register/register_cubit.dart';
import 'package:aqar_go/presentation/feature/edit_create_post/cubit/edit_create_post_cubit.dart';
import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/routing/routing_use_case.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/api/api_service.dart';
import '../../data/api/safe_api_caller.dart';
import '../../data/repo/local_data_repo.dart';
import '../../domain/repo/property_repo.dart';
import '../../domain/usecase/create_property_usecase.dart';
import '../../presentation/feature/auth/login/login_cubit.dart';
import '../../presentation/feature/profile/cubit/profile_cubit.dart';
import '../../presentation/lang/lang_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> di() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  final localDataRepo = LocalDataRepo(
    sharedPrefs: sharedPrefs,
    storage: storage,
  );

  getIt.registerLazySingleton<LocalDataRepo>(() => localDataRepo);

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Accept': 'application/json'},
    );

    final localDataRepo = getIt<LocalDataRepo>();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token =
              await localDataRepo.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
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

  // common
  getIt.registerLazySingleton<APIService>(() => APIService(getIt()));
  getIt.registerLazySingleton<SafeAPICaller>(() => SafeAPICaller());

  // repos:
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt(), getIt()));
  getIt.registerLazySingleton<PropertyRepo>(
    () => PropertyRepoImpl(getIt(), getIt()),
  );

  // use cases:
  getIt.registerLazySingleton<RoutingUseCase>(() => RoutingUseCase(getIt()));
  getIt.registerLazySingleton<CreatePropertyUsecase>(
    () => CreatePropertyUsecase(getIt()),
  );

  // cubits:
  getIt.registerFactory<LangCubit>(() => LangCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt(), getIt()));

  getIt.registerFactory<EditCreatePostCubit>(
    () => EditCreatePostCubit(getIt()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt(), getIt()),
  );
  getIt.registerFactory<MediaPickerCubit>(
    () => MediaPickerCubit(ImagePicker()),
  );
}
