part of 'weather_bloc.dart';

@immutable
// ignore: must_be_immutable
abstract class WeatherState {


}

class WeatherInitialState extends WeatherState {
}

class WeatherLoadingState extends WeatherState {
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({@required this.weatherModel});
}

class WeatherErrorState extends WeatherState {
}