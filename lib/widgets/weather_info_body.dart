// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
// //import 'package:weather_app/models/weather_model.dart';

// class WeatherInfoBody extends StatelessWidget {
//   const WeatherInfoBody({super.key});
// //final WeatherModel weatherModel;
//   @override
//   Widget build(BuildContext context) {
    
//     var weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel;
  
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//          children: [ Text( weatherModel!.CityName,
//               style: const TextStyle(
//                 fontSize: 23,
//               ),
//             ),
//              Text(
//               'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
//               style: TextStyle(
//                 fontSize: 23,
//               ),
//             ),const SizedBox(
//                   height: 32
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.network(weatherModel.image!.contains('https:')?
//                       'https:${weatherModel.image!}':weatherModel.image!,
//                       //'https:${weatherModel.image!}'
//                         ),//i put ! because it always not null
//                        Text(
//                         weatherModel.temp.toString(),
//                         style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold
//                       ),
//                         ),
//                       Column(
//                          children: [
//                            Text(
//                             style: TextStyle(fontSize:15 ),
//                           'Maxtemp:${weatherModel.maxTemp.round()}'),
//                              Text(
//                               style: TextStyle(fontSize:15 ),
//                               'Mintemp: ${weatherModel.minTemp.round()}')
//                          ], 
//                         )

//                     ],
//                   ),
//                  const SizedBox(
//                   height: 32,
//                  ),

//          Text(style:TextStyle(
//               fontSize: 30
//               ,fontWeight:FontWeight.bold  
//             )
//               ,weatherModel.condition)
//           ],
        
//         ),
//       ),
//     );
//   }
// }

// class CustumText extends StatelessWidget {
//   const CustumText({
//     super.key,});

//  // final WeatherModel weatherModel;

//   @override
//   Widget build(BuildContext context) {
    
//     return Text(style:TextStyle(
//      fontSize: 30
//      ,fontWeight:FontWeight.bold  
//                 )
//      ,//weatherModel.CityName
//      BlocProvider.of<GetWeatherCubit>(context).weatherModel!.CityName);
//   }
// }

///////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    
    //var weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel;//i use this way if the tree is complex but if it is simple i prefer use access by state object
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
         children: [ 
          Text( weatherModel.CityName,
              style: const TextStyle(
                fontSize: 23,
              ),
            ),
             Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 23,
              ),
            ),const SizedBox(
                  height: 32
                  ),
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.network(
                    "https:${weatherModel.image}"//ممكن أضيف شرط هنا برده لأنها مش دايما هتجيلي ناقصةhttps:ممكن تيجي كاملة
                // weatherModel.image ?? '',
                //  errorBuilder: (context, error, stackTrace) =>
                //   const Icon(Icons.error), // Handle image load errors
                    ),
                ),
                Expanded(
                  child: Text(
                    weatherModel.temp.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Maxtemp: ${weatherModel.maxTemp.round()}°C',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Mintemp: ${weatherModel.minTemp.round()}°C',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
                 const SizedBox(
                  height: 32,
                 ),

         Text(style:TextStyle(
              fontSize: 30
              ,fontWeight:FontWeight.bold  
            )
              ,weatherModel.condition)
          ],
        
        ),
      ),
    );
  }
}

class CustumText extends StatelessWidget {
  const CustumText({
    super.key, required this.weatherModel,});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    
    return Text(style:TextStyle(
     fontSize: 30
     ,fontWeight:FontWeight.bold  
                )
     ,weatherModel.CityName);
     //BlocProvider.of<GetWeatherCubit>(context).weatherModel.CityName);
  }
}

// //fun takes the data time object and transform it into string
// // DateTime stringToDateTime(String value){
// //   return DateTime.parse(value);
// // }


