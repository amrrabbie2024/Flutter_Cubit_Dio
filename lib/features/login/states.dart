part of 'cubit.dart';

class LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginFailedState extends LoginStates{
  final String msg;

  LoginFailedState({required this.msg});
}

class LoginSuccessState extends LoginStates{
  final LoginData data;

  LoginSuccessState({required this.data});
}