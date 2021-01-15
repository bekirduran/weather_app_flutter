import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Bloc/Theme/theme_bloc.dart';
import 'package:flutter_weather_app/Bloc/weather_bloc.dart';
import 'package:flutter_weather_app/Views/mystyle.dart';

import 'city_name.dart';
import 'forecasting_five_days.dart';
import 'last_update.dart';
import 'max_min_degrees.dart';
import 'search_city.dart';
import 'weather_image_degree.dart';

class WeatherApp extends StatelessWidget {
  Completer<void> _completer = Completer<void>();
  String searchingCity="Ankara";
  String dateTime;
  @override
  Widget build(BuildContext context) {
 

    return BlocBuilder<ThemeBloc,ThemeState>(
      builder: (context, state) =>Scaffold(
        appBar: AppBar(
          backgroundColor: (state as ThemeChanged).themeData ,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
          //leading: Text("Flutter Weather App",style: MyStyle.subTitle,),
          title: Text("Weather App",style: MyStyle.subTitle.copyWith(fontSize: 15)),
          centerTitle: true,
          toolbarHeight: 40,

          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: ()async
            {
             searchingCity = await Navigator.push(context,MaterialPageRoute(builder: (context) => SearchCity(),));
             print(searchingCity);
             if(searchingCity != null)
               BlocProvider.of<WeatherBloc>(context).add(FetchWeather(cityName: searchingCity));
            })
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          // ignore: missing_return
          builder:(context, WeatherState state) {

            if (state is WeatherInitialState){
              return Center(child: Text("City name ..."));
            }
            else if (state is WeatherLoadingState){
              return Center(child: CircularProgressIndicator());
            }
            else  if (state is WeatherLoadedState){
              _completer.complete();
              _completer = Completer();
              final weatherData = state.weatherModel;
              BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(weatherAbbr: weatherData.consolidatedWeather[0].weatherStateAbbr));

              return RefreshIndicator(
                onRefresh: ()async{
                  BlocProvider.of<WeatherBloc>(context).add(RefreshFetchWeather(cityName: searchingCity));
                },
                child: ListView(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(child: CityName(searchingCity:weatherData.title.toUpperCase()),
                      onTap: ()async
                      {
                        searchingCity = await Navigator.push(context,MaterialPageRoute(builder: (context) => SearchCity(),));
                        print(searchingCity);
                        if(searchingCity != null)
                          BlocProvider.of<WeatherBloc>(context).add(FetchWeather(cityName: searchingCity));
                      },),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: LastUpdate(updateTime:weatherData.time,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: WeatherImageAndDegree(
                        currentDegree: (weatherData.consolidatedWeather[0].theTemp).toInt(),
                        weatherState: weatherData.consolidatedWeather[0].weatherStateName,
                        stateAbbr: weatherData.consolidatedWeather[0].weatherStateAbbr,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: MaxMinDegrees(
                        max: weatherData.consolidatedWeather[0].maxTemp.toInt(),
                        min: weatherData.consolidatedWeather[0].minTemp.toInt(),
                      )),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: ForecastingFiveDays(weatherData)),
                    )

                  ],
                ),
              );
            }
            else if (state is WeatherErrorState) {
              return Center(child: Text("Error: There is no such City, try again"));
            }
          } ,

        ),
      ),
    );
  }
}
