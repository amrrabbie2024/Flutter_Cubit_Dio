
import 'package:flutter_cubit_dio/features/login/cubit.dart';
import 'package:flutter_cubit_dio/features/movies/cubit.dart';
import 'package:flutter_cubit_dio/features/weather/cubit.dart';
import 'package:get_it/get_it.dart';

void initGetIt(){
  final getit=GetIt.instance;

  getit.registerFactory(() => MoviesCubit());
  getit.registerFactory(() => WeatherCubit());
  getit.registerFactory(() => LoginCubit());
}