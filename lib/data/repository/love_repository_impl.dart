import 'package:marshmallow/data/model/love_random.dart';
import 'package:marshmallow/data/network/api_service.dart';
import 'package:marshmallow/domain/repository/love_repository.dart';

class LoveRepositoryImpl extends LoveRepository {
  final ApiService apiService;
  LoveRepositoryImpl(this.apiService);

  @override
  Future<LoveRandom> getRandom(String boyName, String girlName) => apiService.getLoveRandom();
}