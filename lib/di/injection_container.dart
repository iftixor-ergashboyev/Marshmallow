import 'package:get_it/get_it.dart';
import 'package:marshmallow/data/network/api_service.dart';
import 'package:marshmallow/data/repository/love_repository_impl.dart';
import 'package:marshmallow/domain/repository/love_repository.dart';
import 'package:marshmallow/domain/use_case/get_random_love.dart';
import 'package:marshmallow/presentation/bloc/love_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoveBloc(sl()));

  sl.registerLazySingleton<LoveRepository>(() => LoveRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetRandomLoveUseCase(sl()));
  sl.registerLazySingleton(() => ApiService(buildDioClient("https://www.randomnumberapi.com/api/v1.0"))); // o'zinikini qo'y
}