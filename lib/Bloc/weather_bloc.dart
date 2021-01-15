import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/Management/weather_management.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherBloc() : super(WeatherInitialState());

  WeatherManagement weatherManagement = locator.get<WeatherManagement>();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
   if( event is FetchWeather){
     yield WeatherLoadingState();
     try {
       // Fetching Weather Data
       final WeatherModel weatherData = await weatherManagement.getWeather(event.cityName);
       yield WeatherLoadedState(weatherModel: weatherData );
     }catch(e){
       yield WeatherErrorState();
     }
   }
   else if( event is RefreshFetchWeather){
     yield WeatherLoadingState();
     try {
       // Fetching Weather Data
       final WeatherModel weatherData = await weatherManagement.getWeather(event.cityName);
       yield WeatherLoadedState(weatherModel: weatherData );
     }catch(e){
     }
   }


  }
}
