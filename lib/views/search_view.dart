import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16
          ),
        child: Center(
          child:  TextField(
            onSubmitted: (value) //here is the part activated when the user press submit point that i can begin trigger the request
           async{
            //WeatherModel weatherModel= await WeatherService(Dio()).getCurrentWeather(cityName: value);
           var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);//بتدور علي كيوبت بيتم توفيره
           getWeatherCubit.getWeather(CityName: value);
     //log(weatherModel.CityName); to check that the code operate perfectlly
     Navigator.pop(context);//to make pop ti the page i stand on it 
     //pop isn't suitable here because it give me a build page before i can't modify on it
      //  Navigator.push(context, MaterialPageRoute(builder: (context){
      //   return
      //  }
       //))
            },
            decoration: InputDecoration(//it hasn't height attribute so we use content padding
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20
                ,vertical: 16
              ),
              labelText: 'Search',
              suffixIcon: const Icon(Icons.search),//allows you to add a custom widget to the trailing (right) side of a text field.
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16)
              )
            ),
          ),
        ),
      ),
    );
  }
}
//WeatherModel? weatherModel;//global object i can use it at any place in our project
//it must be nullabe because at first noweatherbody page it appers=null then the weather appears ==notnull
//generally it isn't prefered to use global else if it is too important and there is no excange