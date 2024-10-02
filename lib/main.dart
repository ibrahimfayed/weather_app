import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const weatherApp());
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(//i use it to make create to GetWeatherCubit
      create: (context) => GetWeatherCubit(),//i put here the cubit i want to provide to the thing away from material app
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         // primarySwatch:Colors.green,
         //  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
        ),
        // theme: ThemeData(
           //it used to control on a collection of colors
       
        // ),
        //debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
