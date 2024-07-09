import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marshmallow/domain/model/couple.dart';
import 'package:marshmallow/presentation/bloc/text/love_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repository/local_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final LocalRepository localRepository;
  HistoryBloc(this.localRepository) : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) async {
      if(event is OnGetHistory) {
        await Future.delayed(const Duration(seconds: 1));
        emit(OnHistorySuccess(await localRepository.getAllHistory()));
      } else if(event is OnSaveHistory) {
        await localRepository.insertHistory(event.couple);
      }
      else if(event is OnClearHistory) {
        await localRepository.clearAllHistory();
        emit(OnHistorySuccess(const []));
      }
    });
  }
}