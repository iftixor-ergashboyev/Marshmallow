import 'package:marshmallow/domain/model/couple.dart';

abstract class LocalRepository {
  Future<void> insertHistory(Couple couple);
  Future<List<Couple>> getAllHistory();
  Future<void> clearAllHistory();
}