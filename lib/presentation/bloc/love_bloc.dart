import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:marshmallow/domain/use_case/get_random_love.dart';

part 'love_event.dart';
part 'love_state.dart';

class LoveBloc extends Bloc<LoveEvent, LoveState> {

  final GetRandomLoveUseCase getRandomLoveUseCase;


  LoveBloc(this.getRandomLoveUseCase) : super(LoveInitial()) {
    on<LoveEvent>((event, emit) async {
      if (event is GetRandomLove) {
        emit(LoveLoading());
        await Future.delayed(const Duration(seconds: 2));
        final value = await getRandomLoveUseCase(event.boyName, event.girlName);
        if(value.random != null) {
          emit(LoveSuccess(value.random!));
        } else {
          emit(const LoveError("Check your internet connect!"));
        }
      }
      }
    );
  }
}
