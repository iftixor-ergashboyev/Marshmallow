import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
import 'package:marshmallow/domain/model/couple.dart';
import '../../../domain/use_case/get_random_love.dart';

part 'love_event.dart';

part 'love_state.dart';

class LoveBloc extends Bloc<LoveEvent, LoveState> {

  final GetRandomLoveUseCase getRandomLoveUseCase;

  LoveBloc(this.getRandomLoveUseCase) : super(LoveInitial()) {
    on<LoveEvent>((event, emit) async {
      if (event is GetRandomLove) {
        emit(LoveLoading());
        // try {
        //   final vaaa = await http.get(Uri.parse('http://10.0.2.2:8080/random'));
        //   print(vaaa.body);
        //   print(vaaa.statusCode);
        // } catch(e) {
        //   print(e);
        // }

        await Future.delayed(const Duration(seconds: 2));
        final value = await getRandomLoveUseCase(event.boyName, event.girlName);
        if(value?.random != null) {
          emit(LoveSuccess(value?.random ?? 0));
        } else {
          emit(const LoveError("Check your internet connection!"));
        }
      } else if (event is GetLoveInitial){
        emit(LoveInitial());
      }
    });
  }
}