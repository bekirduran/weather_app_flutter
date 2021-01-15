import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Bloc/Theme/theme_bloc.dart';
import 'package:flutter_weather_app/Bloc/weather_bloc.dart';

import 'Views/weather_main.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
            child: WeatherApp(),
        )
    );
  }
}
