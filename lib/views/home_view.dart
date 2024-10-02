import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const SearchView();
            },
            ),
            );
          },
           icon: Icon(
            Icons.search
            ,color:Colors.white ,),
          )
        ],
        title : const Text(
          style: TextStyle(color: Colors.white)
          ,'weather App'),
        ),
        //body:weatherModel==null? const NoWeatherBody():WeatherInfoBody(),
          body:BlocBuilder<GetWeatherCubit,WeatherState>( //discussed in vidio 246
            builder:(context, state){
           if (state is WeatherinitialState){
            return const NoWeatherBody();
           }else if(state is WeatherLoadedStates){//here i checked with is because i want to know its type
            return  WeatherInfoBody(
              weatherModel: state.weatherModel,// i don't prefer this methoud when the tree is big and complex like custum widget
            );
           }else{
            return const Text('oops there was an error');
           }
            }
            
             ),
    );
  }
}