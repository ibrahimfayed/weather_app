import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';



class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherinitialState());
   
  
  // WeatherModel? weatherModel;//isteed of recieve it in state

  getWeather({required String CityName})async{
    //i can't add NoWeatherState() here because the methoud be activated when i doing search not in the starting of an app so the right place in the initial state in the previous line
   try {
  WeatherModel weatherModel =
    await WeatherService(Dio()).getCurrentWeather(cityName: CityName);
    emit(WeatherLoadedStates(weatherModel));//i use emit to send the states to UI
} catch (e) {
  emit(WeatherFailureState(
    e.toString()//it will show me the error message as string
  ));
}
     //i use it to talk with UI
  }
  
}

// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
// import 'package:weather_app/models/weather_model.dart';   

// import 'package:weather_app/services/weather_service.dart';
// import 'package:weather_app/views/search_view.dart';   


// class GetWeatherCubit extends Cubit<WeatherState> {
//   GetWeatherCubit() : super(WeatherinitialState());

//   getWeather({required   
//  String CityName}) async {
//     emit(WeatherLoadedStates(weatherModel));
//     try {
//       final weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: CityName);
//       emit(WeatherLoadedStates(weatherModel));
//     } catch (e) {
//       emit(WeatherFailureState(e.toString()));
//     }
//   }
// }