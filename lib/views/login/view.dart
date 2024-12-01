import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_dio/core/design/app_failed.dart';
import 'package:flutter_cubit_dio/core/design/app_input.dart';
import 'package:flutter_cubit_dio/core/design/app_loading.dart';
import 'package:flutter_cubit_dio/core/logic/helper_methods.dart';
import 'package:flutter_cubit_dio/features/login/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final keyForm=GlobalKey<FormState>();

final kbloc=KiwiContainer().resolve<LoginCubit>();
final gbloc=GetIt.I<LoginCubit>();

final emailController=TextEditingController(text: "");
final passwordController=TextEditingController(text: "");

bool isPassword=true;

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Form(
            key: keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _email(),
                SizedBox(height: 24,),
                _password(),
                SizedBox(height: 36,),
                BlocConsumer(
                  bloc: kbloc,
                  listener: (context, state) {
                    if(state is LoginFailedState)
                      showMessage(state.msg);
                    else if(state is LoginSuccessState)
                      showMessage(state.data.message,isSucess: true);
                  },
                  builder: (context, state) {
                    if(state is LoginFailedState)
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _loginButton(),
                          AppFailed(msg: state.msg)
                        ],
                      );
                    else if(state is LoginSuccessState)
                      return _loginButton();
                    else if(state is LoginLoadingState)
                      return AppLoading();
                    else
                      return _loginButton();
                  },
                ),
                SizedBox(height: 16,),
                _signUp()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return AppInput(
      controller: emailController,
      validator: (value) {
        if(value!.isEmpty)
          return "Must enter your email address";
        else if(!value.contains("@"))
          return "Invalid email";
        else if(!value.contains("."))
          return "Invalid email";
        else return null;
      },
      keyboardType: TextInputType.emailAddress,
      hintText: "type here your email",
      labelText: "Email",
      prefix: Icon(Icons.email),
      alignLabelWithHint: true,
    );
  }

  Widget _password() {
    return AppInput(
      controller: passwordController,
      validator: (value) {
        if(value!.isEmpty)
          return "Must enter your password";
        else if(value.length < 8)
          return "Password must be at least 8 chracters";
        else return null;
      },
      keyboardType: TextInputType.text,
      hintText: "type here your password",
      labelText: "Password",
      prefix: Icon(Icons.password),
      alignLabelWithHint: true,
      obscureText: isPassword,
      suffix: IconButton(onPressed: () {
        setState(() {
          isPassword=!isPassword;
        });
      }, icon: Icon(isPassword?Icons.visibility:Icons.visibility_off)),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      height: 70,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FilledButton.icon(onPressed: () {
          if(keyForm.currentState!.validate()){
            kbloc.getLogin(emailController.text, passwordController.text);
          }
        }, icon: Icon(Icons.login), label: Text("Login")),
      ),
    );
  }

  Widget _signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Do not have account?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
        TextButton(onPressed: () {

        }, child: Text("Sign up"))
      ],
    );
  }
}
