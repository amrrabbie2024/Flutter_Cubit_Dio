part of 'cubit.dart';

class LoginData {

  late final String message;
  late final String token;

  LoginData.fromJson(Map<String, dynamic> json){
    message = json['message'];
    token = json['token'];
  }


}