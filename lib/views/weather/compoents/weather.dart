
part of '../view.dart';
class WeatherSection extends StatelessWidget {

  final WeatherData weatherData;
  const WeatherSection({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("City:- ${weatherData.name}",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
        CircleAvatar(radius: 50,backgroundColor: Theme.of(context).primaryColor,child: CircleAvatar(radius: 48,backgroundImage: NetworkImage("http://openweathermap.org/img/w/${weatherData.weather[0].icon}.png"),)),
        SizedBox(height: 16,),
        Text("Description:- ${weatherData.weather[0].description}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
        Text("Temp:- ${weatherData.main.temp}",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
        Text("Humdity:- ${weatherData.main.humidity}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
        Text("Pressure:- ${weatherData.main.pressure}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
        Text("Wind:- ${weatherData.wind.speed}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
        Text("Clouds:- ${weatherData.clouds.all}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
        SizedBox(height: 16,),
      ],
    );
  }
}
