
import 'package:weather_app/models/weather_model.dart';

class WeatherState {//it is Inheritness concept discussed in vidio 240 create cubit
  
}

//class NoWeatherState extends WeatherState {}
class WeatherinitialState extends WeatherState {}
class WeatherLoadedStates extends WeatherState{
  final WeatherModel weatherModel;//it represents the data which i concerned with
  //final WeatherModel? weatherModel;
  WeatherLoadedStates(this.weatherModel);
}


class WeatherFailureState extends WeatherState{

  final String errormessage;

  WeatherFailureState(this.errormessage);

}