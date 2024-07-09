import '../../data/model/love_random.dart';

abstract class LoveRepository {
  Future<LoveRandom?> getRandom(String boyName, String girlName);
}