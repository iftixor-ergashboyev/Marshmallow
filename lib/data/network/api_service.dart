import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../model/love_random.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/random?min=0&max=100")
  Future<List<int>> getLoveRandom();
}
Dio buildDioClient(String base) { // flutter resource da bor
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}