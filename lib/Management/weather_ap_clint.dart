import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter_weather_app/Model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
static const baseUrl = "https://www.metaweather.com";
final http.Client  httpClient = http.Client();

Future<int> getCityId(String cityName) async{
  final cityUrl = "$baseUrl/api/location/search/?query=$cityName";
  final cityUrlResponse = await httpClient.get(cityUrl);
  print("Bak bura: ${cityUrlResponse.body}");

  final jsonResponse = jsonDecode(cityUrlResponse.body);
  return jsonResponse[0]["woeid"];
}

Future<WeatherModel> getWeatherData (int cityId) async{

  final weatherUrl = "$baseUrl/api/location/$cityId/";
  final weatherUrlResponse = await httpClient.get(weatherUrl);

  final jsonResponse = jsonDecode(weatherUrlResponse.body);
  return WeatherModel.fromJson(jsonResponse);
}


}