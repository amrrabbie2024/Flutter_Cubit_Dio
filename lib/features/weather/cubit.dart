import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_dio/core/logic/dio_helper2.dart';

part 'model.dart';
part 'states.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit():super(WeatherStates());


  Future<void> getWeatherData(String q) async {
    emit(WeatherLoadingState());

    final response=await DioHelper2.get("weather",data: {
      "q":q,
      "appid":"509dc5d730ff2dd6003b22f30ae93313"
    });

    if(response.isSucess){
      final model=WeatherData.fromJson(response.data);
      emit(WeatherSuccessState(weatherData: model));
    }else{
      print("Error:- ${response.msg}");
      emit(WeatherFailedState(msg: response.msg));
    }
  }
}