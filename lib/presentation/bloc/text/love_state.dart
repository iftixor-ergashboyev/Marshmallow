part of 'love_bloc.dart';

sealed class LoveState extends Equatable {
  const LoveState();

  @override
  List<Object?> get props => [];
}

final class LoveInitial extends LoveState {
  @override
  List<Object> get props => [];
}

final class LoveSuccess extends LoveState {
  final int value;

  const LoveSuccess(this.value);

  @override
  List<Object?> get props => [];
}
final class LoveError extends LoveState {
  final String errorMessage;

  const LoveError(this.errorMessage);
  @override
  List<Object?> get props => [];
}
final class LoveLoading extends LoveState {}