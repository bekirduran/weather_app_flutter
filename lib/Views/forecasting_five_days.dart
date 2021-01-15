

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';

import 'mystyle.dart';
import 'weather_image.dart';

class ForecastingFiveDays extends StatefulWidget {
  WeatherModel _weatherModel;
  ForecastingFiveDays(this._weatherModel);

  @override
  _ForecastingFiveDaysState createState() => _ForecastingFiveDaysState(_weatherModel);
}

class _ForecastingFiveDaysState extends State<ForecastingFiveDays> {

  WeatherImage weatherImage = WeatherImage();
  WeatherModel _weatherModel;

  _ForecastingFiveDaysState(this._weatherModel);
  PageController _pageController = PageController(initialPage: 0,keepPage: true);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width:  MediaQuery.of(context).size.width - 30,
      child: PageView(
        controller:_pageController ,
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.yellow.shade50, Colors.white]
              )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDetailInfo(_weatherModel.consolidatedWeather[1]),
                Container(
                  width: 2,
                  color: Colors.grey.shade200,
                ),
                buildDetailInfo(_weatherModel.consolidatedWeather[2]),
              ],
            )
          ),

          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.yellow.shade50, Colors.white]
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildDetailInfo(_weatherModel.consolidatedWeather[3]),
                  Container(
                    width: 2,
                    color: Colors.grey.shade100,
                  ),
                  buildDetailInfo(_weatherModel.consolidatedWeather[4]),
                ],
              )
          ),

          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white,Colors.yellow.shade100, Colors.white]
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildDetailInfo(_weatherModel.consolidatedWeather[5]),
                ],
              )
          ),

        ],
      ),
    );
  }

  Column buildDetailInfo(ConsolidatedWeather consolidatedWeather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _date(consolidatedWeather),
                  _imageIcon(consolidatedWeather),
                  _stateAndDegree(consolidatedWeather),
                  _minMax(consolidatedWeather),
                  Divider(),
                  _detailInfo(consolidatedWeather),
                ],
              );
  }

  Widget _date(ConsolidatedWeather consolidatedWeather){
    return  Text("${consolidatedWeather.applicableDate.day} /"
        " ${consolidatedWeather.applicableDate.month} /"
        "${consolidatedWeather.applicableDate.year}",style: MyStyle.date,  );
  }

  Widget _imageIcon(ConsolidatedWeather consolidatedWeather){
    return  Container(
        width: 70, height: 70,
        child: weatherImage.weatherStatusImage(consolidatedWeather.weatherStateAbbr));
  }

  Widget _stateAndDegree(ConsolidatedWeather consolidatedWeather){
    return Row(
      children: [
        Text(consolidatedWeather.weatherStateName,style: MyStyle.deggreFont.copyWith(fontSize: 15, color: Colors.yellow.shade900),),
        SizedBox(width: 15,),
        Text(consolidatedWeather.theTemp.toInt().toString(),style: MyStyle.biggerFont.copyWith(fontSize: 20,color: Colors.black54),),
        Text("°C",style: MyStyle.deggreFont,)
      ],
    );
  }

  Widget _minMax(ConsolidatedWeather consolidatedWeather){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text("Max: ",style: MyStyle.subTitle.copyWith(fontSize: 12,color: Colors.black54),),
            Text(consolidatedWeather.maxTemp.toInt().toString(),style: MyStyle.subTitle.copyWith(fontSize: 14,color: Colors.black54),),
            Text("°C",style: MyStyle.deggreFont.copyWith(fontSize: 12),),
          ],
        ),
        SizedBox(width: 15,),
        Row(
          children: [
            Text("Min: ",style: MyStyle.subTitle.copyWith(fontSize: 12,color: Colors.black54),),
            Text(consolidatedWeather.minTemp.toInt().toString(),style: MyStyle.subTitle.copyWith(fontSize: 14,color: Colors.black54),),
            Text("°C",style: MyStyle.deggreFont.copyWith(fontSize: 12),),
          ],
        ),
      ],
    );
  }

  Widget _detailInfo(ConsolidatedWeather consolidatedWeather){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.speed,color: Colors.blueGrey,),
            SizedBox(width: 15),
            Text("Wind speed",style: MyStyle.details),
            SizedBox(width: 15),
            Text(consolidatedWeather.windSpeed.floor().toString() + " km")
          ],
        ),
        Row(
          children: [
            Icon(Icons.cloud_download_outlined,color: Colors.blueGrey,),
            SizedBox(width: 15),
            Text("Air pressure",style: MyStyle.details,),
            SizedBox(width: 15),
            Text(consolidatedWeather.airPressure.floor().toString() + " bar")
          ],
        ),
        Row(
          children: [
            Icon(Icons.stream,color: Colors.blueGrey,),
            SizedBox(width: 15),
            Text("Humidity",style: MyStyle.details),
            SizedBox(width: 15),
            Text(consolidatedWeather.humidity.floor().toString())
          ],
        ),
        Row(
          children: [
            Icon(Icons.remove_red_eye,color: Colors.blueGrey,),
            SizedBox(width: 15),
            Text("Visibility",style: MyStyle.details),
            SizedBox(width: 15),
            Text(consolidatedWeather.visibility.floor().toString())
          ],
        ),
      ],
    );
  }

}
