import 'package:flutter_weather_app/Management/weather_ap_clint.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';
import '../locator.dart';

class WeatherManagement {
    WeatherApiClient weatherApiClient = locator.get<WeatherApiClient>();

    Future<WeatherModel> getWeather(String city) async {
        final int cityId = await weatherApiClient.getCityId(city);
        return await weatherApiClient.getWeatherData(cityId);
    }
}