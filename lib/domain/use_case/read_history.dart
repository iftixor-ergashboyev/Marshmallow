import 'package:marshmallow/domain/model/couple.dart';
import 'package:marshmallow/domain/repository/local_repository.dart';

abstract class IReadAllHistoryUseCase {
  Future<List<Couple>> call();

}

class ReadAllHistoryUseCase extends IReadAllHistoryUseCase {
  final LocalRepository localRepository;
  ReadAllHistoryUseCase(this.localRepository);
  @override
  Future<List<Couple>> call() => localRepository.getAllHistory();
}