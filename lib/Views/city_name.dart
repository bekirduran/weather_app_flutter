import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Views/mystyle.dart';

class CityName extends StatelessWidget {
  final String searchingCity;

  CityName({@required this.searchingCity});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.my_location),
          SizedBox(width: 10,),
          Text(searchingCity,style: MyStyle.biggerFont,),
        ],
      ),
    );
  }
}
