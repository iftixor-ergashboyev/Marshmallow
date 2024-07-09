part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class OnSaveHistory extends HistoryEvent {
  final Couple couple;
  OnSaveHistory(this.couple);

  @override
  List<Object?> get props => [couple];
}

final class OnGetHistory extends HistoryEvent {}
final class OnClearHistory extends HistoryEvent {}