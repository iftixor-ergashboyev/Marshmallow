part of 'love_bloc.dart';

sealed class LoveEvent extends Equatable {
  const LoveEvent();

  @override
  List<Object?> get props => [];
}

class GetLoveInitial extends LoveEvent {}

class GetRandomLove extends LoveEvent {
  final String boyName;
  final String girlName;

  const GetRandomLove(this.boyName, this.girlName);
  @override
  List<Object?> get props => [boyName, girlName];
}