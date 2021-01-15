import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Views/mystyle.dart';

class MaxMinDegrees extends StatelessWidget {
  int max;
  int min;


  MaxMinDegrees({@required this.max,@required this.min});

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
    Text("Max Degree: $max °C",style: MyStyle.deggreFont.copyWith(color: Colors.black54)),
        Container(
          width: 1,
          height: 20,
          color: Colors.grey,
        ),
    Text("Min Degree: $min °C",style: MyStyle.deggreFont.copyWith(color: Colors.black54)),

      ],
    );
  }
}
