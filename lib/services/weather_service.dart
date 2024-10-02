import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
 //i put the dio object of weather service because i might have a lot of methoud need this object
 //final Dio dio = Dio(); it equals the next 2 lines but them is better
  final Dio dio;
  WeatherService(this.dio);

  //final String domain = 'api.weatherapi.com';//if the domain isn't stable so i make it as a variable
  final String baseUrl = 'https://api.weatherapi.com/v1';//v1 is the path ,api.weatherapi.com is the domain
  final String apiKey = '2fa1922a6b364517a14211604242807';

  Future<WeatherModel> getCurrentWeather({required String cityName})async{//when the methoud be async i can't put this return from type WeatherModel so i add future to it
  //i make try and catch because the response might be not available and user may enter the values wrong
  try {
  Response response =  await dio.get(
    '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');//here i put my request
   //'https://api.weatherapi.com/v1/forecast.json?key=2fa1922a6b364517a14211604242807&q=$cityName&days=1');//the request without any changes 
   
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);//here i get the data
    return weatherModel;
  //  if (response.statusCode==200){
  //  WeatherModel weatherModel = WeatherModel.fromJson(response.data);//here i get the data
  // //  }else{
  //   final String errormessege = response.data['error']['message'];
  //   throw Exception(errormessege);
  //   }
   //tell me the state of request i do
   
  // return weatherModel;

  // i don't need to check on statuscode because response will be returned to me at all states and because i uses dio package we need it if we use http package
  
} on DioException catch (e) {
  final String errormessege = e.response?.data['error']['message']??'oops there was an error';//there is an error because it may returned null because maybe there is no response returned
  // ?in the previous line mean if it notnull return .data['error']['message'] and ?? means if it returned null return 'oops there was an error'
  throw Exception(errormessege);

  //return null;
}catch(e){//if another exception
log(e.toString());
throw Exception('oops there was an error ,try later');

}
 
  }
//q is an input value so i shoud remove it from this request
//if i need the data of more than one item we will use loop 
  
}