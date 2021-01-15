
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherImage {

  Widget weatherStatusImage(String weatherState ) {

        return SvgPicture.network(
          "https://www.metaweather.com/static/img/weather/$weatherState.svg",
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()),
        );
  }

}