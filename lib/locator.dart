
import 'package:flutter_weather_app/Management/weather_management.dart';
import 'package:get_it/get_it.dart';
import 'Management/weather_ap_clint.dart';



final locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => WeatherManagement());
  locator.registerLazySingleton(() => WeatherApiClient());
}
