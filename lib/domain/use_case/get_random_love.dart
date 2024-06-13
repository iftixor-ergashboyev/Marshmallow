import 'package:marshmallow/data/model/love_random.dart';
import 'package:marshmallow/domain/repository/love_repository.dart';

class GetRandomLoveUseCase {
  final LoveRepository loveRepository;

  const GetRandomLoveUseCase(this.loveRepository);

  Future<LoveRandom> call(String boyName, String girlName) async {
    return await loveRepository.getRandom(boyName, girlName);
  }
}