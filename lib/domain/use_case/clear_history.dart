import 'package:marshmallow/domain/repository/local_repository.dart';

abstract class IClearHistoryUseCase {
  Future<void> call();
}

class ClearHistoryUseCase extends IClearHistoryUseCase {
  final LocalRepository localRepository;
  ClearHistoryUseCase(this.localRepository);

  @override
  Future<void> call() => localRepository.clearAllHistory();
}