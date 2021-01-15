import 'package:flutter/material.dart';
import 'file:///D:/FlutterProjelerim/flutter_weather_app/lib/Views/weather_image.dart';
import 'package:flutter_weather_app/Views/mystyle.dart';



class WeatherImageAndDegree extends StatelessWidget {
  String weatherState;
  int currentDegree;
  String stateAbbr;


  WeatherImageAndDegree({@required this.weatherState,@required this.currentDegree,@required this.stateAbbr});

  @override
  Widget build(BuildContext context) {
    WeatherImage weatherImage = WeatherImage();

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 130,height: 130, child:  weatherImage.weatherStatusImage(stateAbbr),),
          SizedBox(width: 15,),
          Text(weatherState,style: MyStyle.deggreFont.copyWith(color: Colors.yellow.shade900),),
          SizedBox(width: 15,),
          Text("$currentDegree",style: MyStyle.biggerFont.copyWith(fontSize: 38,color: Colors.black54),),
          Text("°C",style: MyStyle.deggreFont,)
        ],
      ),
    );
  }
}
