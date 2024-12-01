
import 'package:flutter_cubit_dio/features/login/cubit.dart';
import 'package:flutter_cubit_dio/features/movies/cubit.dart';
import 'package:flutter_cubit_dio/features/weather/cubit.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi(){
  final kiwi=KiwiContainer();


  kiwi.registerFactory((container) => MoviesCubit());
  kiwi.registerFactory((container) => WeatherCubit());
  kiwi.registerFactory((container) => LoginCubit());
}