part of 'history_bloc.dart';

@immutable
sealed class HistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HistoryInitial extends HistoryState {}
final class OnHistorySuccess extends HistoryState {
  final List<Couple> historyList;

  OnHistorySuccess(this.historyList);

  @override
  List<Object?> get props => [];
}