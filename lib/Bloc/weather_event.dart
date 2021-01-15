part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}


class FetchWeather extends WeatherEvent {
  final String cityName;
  FetchWeather({@required this.cityName});
}

class RefreshFetchWeather extends WeatherEvent {
  final String cityName;
  RefreshFetchWeather({@required this.cityName});
}
