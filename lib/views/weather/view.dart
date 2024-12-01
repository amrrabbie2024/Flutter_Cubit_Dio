import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_dio/core/logic/helper_methods.dart';
import 'package:flutter_cubit_dio/features/weather/cubit.dart';
import 'package:get_it/get_it.dart';
part 'compoents/weather.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

final cityController=TextEditingController(text: "");
final keyForm=GlobalKey<FormState>();

final gbloc=GetIt.I<WeatherCubit>();

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _searchText(),
              SizedBox(height: 16,),
              BlocConsumer(
                bloc: gbloc,
                listener: (context, state) {
                  if (state is WeatherFailedState)
                    showMessage(state.msg);
                  else if (state is WeatherSuccessState)
                    showMessage("Success", isSucess: true);
                },
                builder: (context, state) {
                  if (state is WeatherFailedState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _searchButton(),
                        SizedBox(height: 16,),
                        Center(child: Text(state.msg, style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),))
                      ],
                    );
                  else if (state is WeatherSuccessState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _searchButton(),
                        SizedBox(height: 16,),
                        WeatherSection(weatherData: state.weatherData,),
                      ],
                    );
                  else if (state is WeatherLoadingState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _searchButton(),
                        SizedBox(height: 16,),
                        Center(child: CircularProgressIndicator(color: Theme
                            .of(context)
                            .primaryColor,
                          backgroundColor: Colors.green,
                          strokeWidth: 8,))
                      ],
                    );
                  else
                    return
                      _searchButton
                        (
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchText() {
    return TextFormField(
      controller: cityController,
      validator: (value) {
        if (value!.isEmpty)
          return "Must enter city";
        else
          return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "City",
        hintText: "Type here city name",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme
                .of(context)
                .primaryColor)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme
                .of(context)
                .primaryColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme
                .of(context)
                .primaryColor)
        ),
      ),
    );
  }

  Widget _searchButton() {
    return SizedBox(
      height: 55,
      child: FilledButton(
          style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.green)
              )
          ),
          onPressed: () {
            if (keyForm.currentState!.validate()) {
              gbloc.getWeatherData(cityController.text);
            }
          }, child: Text("Show data ...")),
    );
  }
}
