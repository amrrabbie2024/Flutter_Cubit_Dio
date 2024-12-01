import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_dio/core/logic/dio_helper3.dart';

part 'states.dart';
part 'model.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginStates());

  Future<void> getLogin(String email,String password) async {
    emit(LoginLoadingState());

    final response=await DioHelper3.send("user/signin",data: {
      "email":email,
      "password":password
    });

    if(response.isSucess){
      final model=LoginData.fromJson(response.data);
      emit(LoginSuccessState(data: model));
    }else{
      print("Error:- ${response.msg}");
      emit(LoginFailedState(msg: response.msg));
    }
  }

}