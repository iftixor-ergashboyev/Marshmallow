import 'package:get_it/get_it.dart';
import 'package:marshmallow/data/db/history_db.dart';
import 'package:marshmallow/data/network/api_service.dart';
import 'package:marshmallow/data/repository/local_repository_impl.dart';
import 'package:marshmallow/data/repository/love_repository_impl.dart';
import 'package:marshmallow/domain/repository/love_repository.dart';
import 'package:marshmallow/domain/use_case/clear_history.dart';
import 'package:marshmallow/domain/use_case/get_random_love.dart';
import 'package:marshmallow/domain/use_case/insert_history.dart';
import 'package:marshmallow/domain/use_case/read_history.dart';
import 'package:marshmallow/presentation/bloc/history/history_bloc.dart';
import 'package:marshmallow/presentation/bloc/text/love_bloc.dart';

import '../domain/repository/local_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoveBloc(sl()));
  sl.registerFactory(() => HistoryBloc(sl()));

  final db = await $FloorHistoryDb.databaseBuilder("history.db").build();

  sl.registerLazySingleton<LoveRepository>(() => LoveRepositoryImpl(sl()));
  sl.registerLazySingleton<LocalRepository>(() => LocalRepositoryImpl(db.loveDao));
  sl.registerLazySingleton(() => GetRandomLoveUseCase(sl()));
  sl.registerLazySingleton(() => InsertHistoryUseCase(sl()));
  sl.registerLazySingleton(() => ClearHistoryUseCase(sl()));
  sl.registerLazySingleton(() => ReadAllHistoryUseCase(sl()));
  sl.registerLazySingleton(() => ApiService(buildDioClient("https://www.randomnumberapi.com/api/v1.0"))); // o'zinikini qo'y
}