import 'package:marshmallow/domain/model/couple.dart';
import 'package:marshmallow/domain/repository/local_repository.dart';

abstract class IInsertHistoryUseCase {
  Future<void> call(Couple couple);
}

class InsertHistoryUseCase extends IInsertHistoryUseCase {
  final LocalRepository localRepository;

  InsertHistoryUseCase(this.localRepository);

  @override
  Future<void> call(Couple couple) => localRepository.insertHistory(couple);
}