class WeatherModel {//may in the api tell me if it is null or not
  final String CityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double minTemp; 
  final double maxTemp;//the type of the variable i write it according to api not me
  final String condition;

  WeatherModel({
    required this.CityName,
    required this.date,
    this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.condition});//حالة الطقس  

    factory WeatherModel.fromJson(json){
  return WeatherModel(
    CityName: json ['location']['name'],//json is the main map
    date: DateTime.parse(json ['current']['last_updated'])  ,//i use the date inside current not forcast because i concerned just with the hour not year,mounth,day 
    temp: json ['forecast']['forecastday'][0]['day']['avgtemp_c'],
    minTemp:json ['forecast']['forecastday'][0]['day']['mintemp_c'],
    maxTemp: json ['forecast']['forecastday'][0]['day']['maxtemp_c'],
    condition: json ['forecast']['forecastday'][0]['day']['condition']['text'],
    image: json ['forecast']['forecastday'][0]['day']['condition']['icon']
    );
}
}
//here logically that all of parmeters not null except image
