import 'package:marshmallow/data/db/love_dao.dart';
import 'package:marshmallow/domain/model/couple.dart';
import 'package:marshmallow/domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {

  final LoveDao dao;

  LocalRepositoryImpl(this.dao);
  @override
  Future<void> clearAllHistory() async {
    await dao.clearHistory();
  }

  @override
  Future<List<Couple>> getAllHistory() async {
    return await dao.getAllHistory();
  }

  @override
  Future<void> insertHistory(Couple couple) async {
    await dao.insertHistory(couple);
  }
}